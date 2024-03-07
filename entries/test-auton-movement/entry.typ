#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#import "/utils.typ"

#show: create-body-entry.with(
  title: "Test: Autonomous Movement",
  type: "test",
  date: datetime(year: 2024, month: 1, day: 24),
  author: "Felix Hass",
  witness: "Meghana Noojipady",
)

#metadata(none) <test-auton-movement>

While implementing our autonomous routines, we noticed that our movements were
extremely imprecise. While our odometry could compensate for this, it was
leading to our routes being pretty inconsistent. We decided it would be worth it
to spend time testing and tuning our PID controllers.

= Testing Procedure

The process we used for tuning our controllers is as follows:

== Linear Controller

The linear controller controls forward and backward motion. We used the
following steps to tune this controller.

+ Place the robot onto the field tiles.
+ Prepare the robot with a program containing the following movement:
```cpp
chassis.moveToPoint(0, 10, 5000, {}, false); // Move forward 10 inches
```
You'll also need to include the following code to log the PID output: ```cpp
float total = error * kP + integral * kI + derivative * kD;

if (name == "lateral") {
 lemlib::telemetrySink()->debug("{},{},{},{},{}", 0, total, error * kP, integral
* kI, derivative * kD);
} else if (name == "angular") {
 lemlib::telemetrySink()->debug("{},{},{},{},{}", 1, total, error * kP, integral
* kI, derivative * kD);
}
```
3. Connect to the robot with the Loginator
+ Reset all of the PID gains to 0.
+ Set `kP` to 5.
+ Run the movement, and record the output with the Loginator.
+ Increase `kP`, and run the program again.
+ Continue the last step until the robot starts oscillating around the point.
+ Increase `kD`, and run the program again.
+ Continue the last step until the robot stops oscillating, and the Loginator
  shows that the output doesn't go within 0.5 below 0.

#admonition(
  type: "note",
)[
  Its important to tune the robot on the field directly since different surfaces
  give the robot more or less traction, and we want conditions that are the same
  or identical to an actual auton run.
]

== Angular Controller

The process for tuning the angular controller is largely the same as tuning the
linear one. Use the same steps, except use this movement instead of the other
one:

```cpp
chassis.turnTo(10, 0, 5000, {}, false); // Turn the robot 90 degrees
```

= Results

We've downloaded the testing data from before and after the tuning process.

== Before

Here are the settings we were using prior to the tuning. They are the default
constants for LemLib.

```cpp
// linear motion controller
lemlib::ControllerSettings linearController(
  10, // proportional gain (kP)
  30, // derivative gain (kD)
  1, // small error range, in inches
  100, // small error range timeout, in milliseconds
  3, // large error range, in inches
  500, // large error range timeout, in milliseconds
  20 // maximum acceleration (slew)
);
```

Here's the output of the above 10" movement with the above constants. As you can
see, the movement heavily oscillates, over accelerating, and crossing over the
zero threshold.

#let data = utils.plot-from-csv(read("./linear-before.csv"))
#plot(
  length: 70%,
  title: "Linear Pid Output",
  x-label: "Time (ms)",
  y-label: "Output (voltage)",
  ..data,
)

#colbreak()

Here are the constants we used for the angular controller. They are also the
default for LemLib.

```cpp
// angular motion controller
lemlib::ControllerSettings angularController(
  2, // proportional gain (kP)
  10, // derivative gain (kD)
  1, // small error range, in degrees
  100, // small error range timeout, in milliseconds
  3, // large error range, in degrees
  500, // large error range timeout, in milliseconds
  20 // maximum acceleration (slew)
);
```

Here's the output of the PID controller over time with the 90#sym.degree movement:

#let data = utils.plot-from-csv(read("./angular-before.csv"))
#plot(
  length: 70%,
  title: "Angular Pid Output",
  x-label: "Time (ms)",
  y-label: "Output (voltage)",
  ..data,
)

As you can see, the controller heavily oscillates, and stops moving before it
can get anywhere near the target angle.

== After

After tuning, our results were much better. Here are the final constants we
ended up with for the linear controller. We ended up with a value of 10 for `kP`
and a value of 35 for `kD`.

```cpp
// linear motion controller
inline lemlib::ControllerSettings linearController(
    10,   // proportional gain (kP)
    0,    // integral gain (kI)
    35,   // derivative gain (kD)
    3,    // anti windup
    1,    // small error range, in inches
    100,  // small error range timeout, in milliseconds
    3,    // large error range, in inches
    500,  // large error range timeout, in milliseconds
    40    // maximum acceleration (slew)
);
```

Here's the output of the controller after tuning. As you can see the results are
much better. The output barely crosses the 0 mark, and goes almost directly to
the target.

#let data = utils.plot-from-csv(read("./linear-after.csv"))
#plot(
  title: "Linear Pid Output",
  x-label: "Time (ms)",
  y-label: "Output (voltage)",
  ..data,
)

Here are the new angular constants that we ended up with. We now have a `kP` of
2 and a `kD` of 30.

```cpp
// angular motion controller
inline lemlib::ControllerSettings angularController(
    2,     // proportional gain (kP)
    0.01,  // integral gain (kI)
    30,    // derivative gain (kD)
    3,     // anti windup
    1,     // small error range, in degrees
    100,   // small error range timeout, in milliseconds
    3,     // large error range, in degrees
    500,   // large error range timeout, in milliseconds
    10     // maximum acceleration (slew)
);
```

#admonition(
  type: "note",
)[
We did also end up having to add in a `kI` value of 0.01. No matter what we did
we couldn't get the controller to move exactly to the point, so the integral
term was needed.
]

Here's the output after tuning. As you can see, the controller goes directly to
the target, and doesn't oscillate at all.

#let data = utils.plot-from-csv(read("./angular-after.csv"))
#plot(
  title: "Angular Pid Output",
  x-label: "Time (ms)",
  y-label: "Output (voltage)",
  ..data,
)

Now that the tuning is complete we'll have much faster and more precise
autonomous routines.
