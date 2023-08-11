#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
title: "Decide: Tracking Implementation",
type: "decide",
start_date: datetime(year: 2023, month: 7, day: 28),
)[

We rated each option by robustness, whether it was maintained or not, and how easy it was to use.
- Robustness measures the solutions ability to cover many different use cases, such as different sensor configurations or movement algorithms, and is rated from 0 to 3.
- Maintained is a measurement of how often the code receives updates. This is rated from 0 to 3.
- Ease of use is self explanatory and is rated from 0 to 3.

#nb_decision_matrix(
  properties:("Robustness", "Maintained", "Ease of Use"),
  choices: (
    ("DIY Implementation", 2, 2.5, 1),
    ("LemLib", 2.5, 3, 3),
    ("ARMS", 2, 0, 2.5),
    ("OkapiLib", 3, 1, 2),
  ),
)

#nb_admonition(type: "decision")[
We chose LemLib due to near perfect scores in each category. While it does not have as many features as OkapiLib, it covers our exact feature set, while OkapiLib is missing some things we need. It also has many different developers who are actively working to make it the best it can be. While none of these solutions are plug and play, LemLib is pretty close to it.
]

#nb_heading([Implementation], level: 1)

We looked over LemLib's odometry #footnote("See glossary") implementation #footnote(link("https://github.com/LemLib/LemLib/blob/5b8917e46394118ff8e690b591292b878c661c74/src/lemlib/chassis/odom.cpp#L1C2-L1C2")), and analyzed it to see how it works. 

The odometry runs in its own its own task, asynchronously to the main task. This means that the odometry can run in an infinite loop, without blocking execution of other processes.
```cpp
// tracking thread
pros::Task* trackingTask = nullptr;

void lemlib::init() {
    if (trackingTask == nullptr) { // Check the the task is not already initialized
        trackingTask = new pros::Task {[=] {
            while (true) {
                update(); // Repeatedly call the update function
                pros::delay(10);
            }
        }};
    }
}
```
This task runs the update function repeatedly. This function contains the main part of the implementation. This function does a couple of things every time it is executed.

1. LemLib supports a large number of sensor configurations, and therefore must check if certain sensors are supplied.
```cpp
if (odomSensors.vertical1 != nullptr) vertical1Raw = odomSensors.vertical1->getDistanceTraveled();
if (odomSensors.vertical2 != nullptr) vertical2Raw = odomSensors.vertical2->getDistanceTraveled();
if (odomSensors.horizontal1 != nullptr) horizontal1Raw = odomSensors.horizontal1->getDistanceTraveled();
if (odomSensors.horizontal2 != nullptr) horizontal2Raw = odomSensors.horizontal2->getDistanceTraveled();
if (odomSensors.imu != nullptr) imuRaw = degToRad(odomSensors.imu->get_rotation());
```
LemLib supports up to 4 tracking wheels, two vertical and two horizontal. These sensors can either be integrated motor encoders, V5 rotation sensors, or V4 optical shaft encoders.
LemLib also supports 1 IMU.

2. The function then calculates the change in rotation of the robot. This value is then added to the previous absolute orientation to get the current absolute orientation.

If the robot has two perpendicular tracking wheels the rotation can be calculated with this equation:
#nb_admonition(type: "equation")[
Assuming these variables:
- $Delta theta$ is the absolute rotation
- $Delta L$ is the total distance the left tracking wheel has traveled
- $Delta R$ is the total distance the right tracking wheel has traveled
- $S_L$ is the distance from the left tracking wheel to the tracking center
- $S_R$ is the distance from the right tracking wheel to the tracking center

#align(
 center,
 text(size: 15pt)[
 \

  $Delta theta = (Delta L - Delta R) / (S_L + S_R)$

  \
 ]

)
]

If an IMU is being used, no equation is required, and its output can be used directly.

Each time the loop runs LemLib evaluates which sensors are still connected, and uses the most accurate ones. It prioritizes them in this order: 
  1. V4 optical shaft encoders
  2. V5 rotation sensors
  3. IMU
  4. Integrated motor encoders
This check happening every time this function is called means that the task can respond to sensors disconnecting, making this implementation very resistant to disruption.

```cpp
float heading = odomPose.theta; // Get the last absolute rotation

// calculate the heading using the horizontal tracking wheels
if (odomSensors.horizontal1 != nullptr && odomSensors.horizontal2 != nullptr)
  heading += (deltaHorizontal1 - deltaHorizontal2) /
             (odomSensors.horizontal1->getOffset() -
              odomSensors.horizontal2->getOffset());
// else, if both vertical tracking wheels aren't substituted by the drivetrain,
// use the vertical tracking wheels
else if (!odomSensors.vertical1->getType() && !odomSensors.vertical2->getType())
  heading +=
      (deltaVertical1 - deltaVertical2) /
      (odomSensors.vertical1->getOffset() - odomSensors.vertical2->getOffset());
// else, if the inertial sensor exists, use it
else if (odomSensors.imu != nullptr)
  heading += deltaImu;
// else, use the the substituted tracking wheels
else
  heading +=
      (deltaVertical1 - deltaVertical2) /
      (odomSensors.vertical1->getOffset() - odomSensors.vertical2->getOffset());

float deltaHeading = heading - odomPose.theta;
float avgHeading = odomPose.theta + deltaHeading / 2;

```

3. The task then calculates the local x and y offsets. This step exists only because it makes the calculation simpler. This step operates in a local coordinate plane which is aligned with the rotation of the robot. The x axis of this coordinate plane as parallel to the 

The task then calculates the local x and y offsets. The local coordinate system is relative to the robot, while the global coordinate system is relative to the field. The x coordinate is equal to the distance tracked by the center tracking wheel, while the y coordinate is equal to the distance traveled by the left or right tracking wheel.

If the movement is in a straight line, the calculation is very simple, the distance traveled is simply the distance that the encoders read. However if the robot changed in rotation while moving the math becomes complicated. This is solved by representing the robot's movement with an arc. As you can see below the distance the robot traveled is not equal to the arc length, its equal to the chord length.

#image("../assets/odometry/local-coordinates.svg")

The length of this chord can be calculated with the following equation:

#nb_admonition(type: "equation")[
Assuming these variables:
- $Delta theta$ is the change in angle since the last loop
- $Delta R$ is the distance the right tracking wheel has traveled since the last loop
- $Delta S$ is the distance the center tracking wheel has traveled since the last loop
- $S_R$ is the distance from the right tracking wheel to the tracking center
- $S_S$ is the distance from the center tracking wheel to the tracking center

#align(
 center,
 text(size: 15pt)[
 \

  $Delta limits("d"_"l")^--> = 2 sin((Delta theta)/2) * mat(delim: "[", (Delta S)/(Delta theta) + S_S; (Delta R)/(Delta theta) + S_R ) $

  \
 ]

)
]

```cpp
// calculate local x and y
float localX = 0;
float localY = 0;
if (deltaHeading == 0) { // prevent divide by 0
  localX = deltaX;
  localY = deltaY;
} else {
  localX = 2 * sin(deltaHeading / 2) * (deltaX / deltaHeading + horizontalOffset);
  localY = 2 * sin(deltaHeading / 2) * (deltaY / deltaHeading + verticalOffset);
}
```
4. The algorithm then gets the x and y components of the of the local x and y coordinates to find the change in global position, and then adjusts the global position to compensate.
```cpp
// calculate global x and y
odomPose.x += localY * sin(avgHeading);
odomPose.y += localY * cos(avgHeading);
odomPose.x += localX * -cos(avgHeading);
odomPose.y += localX * sin(avgHeading);
odomPose.theta = heading;
```

#nb_admonition(type: "warning")[
  The math of odometry assumes that each movement measured by the algorithm is extremely small. The logic begins to break down as these movements get larger, which is why the algorithm queries the sensors every 10ms.
]

]
