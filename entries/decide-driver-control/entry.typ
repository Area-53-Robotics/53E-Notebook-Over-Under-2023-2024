#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
title: "Decide: Driver Control",
type: "decide",
start_date: datetime(year: 2023, month: 08, day: 20)
)[

The driver's preferred method of controlling the robot is a subjective decision rather than an objective one. While the different methods do have concrete differences, the decision usually comes down to personal preference rather than objective reasons.
Due to this we've designed this testing procedure in order to find our driver's preferred control method.

#nb_heading([Testing Procedure], level: 1)

1. Place the robot on the green circle in the diagram below.
#set align(center)
#image("./test.svg", height: 35%)
#set align(left)
2. Load a program onto the robot's brain that contains one of the control schemes detailed in the previous entry. The implementation section of this entry will cover what are code for this looked like.
3. Have the driver follow the path marked in green.
4. Repeat the last step 3 more times.
5. Repeat the last 4 steps for the other 2 control schemes.


#nb_heading([Implementation], level: 1)

#nb_heading([Drive Curve], level: 2)

The drive curve is a powerful concept that can be applied to every control scheme. It gives the driver much more control over the robot at lower speeds. Typically the output of the controller and input to the motor's move method is linear. If the output of the joystick is 50, the input to the move method is also 50. If we're using a drive curve we pass the value outputted by the controller into a exponential function first before passing into the move method. This means that a larger part of the joystick axis outputs a lower value, giving the driver more control over the robot without compromising on the maximum speed of the robot.

#set align(center)
#image("./drive-curve.svg", width: 50%)
#set align(left)

#nb_admonition(type: "warning")[
The drive curve must intersect with the normal behavior at three points:
- the maximum output of the joystick axis: (127, 127)
- (0,0)
- the minimum output of the joystick axis: (-127, -127)
]


The function we use was created by team 5225, the E-bots $pi$lons. #footnote(link("https://www.desmos.com/calculator/rcfjjg83zx"))

It looks like this:

#nb_admonition(
type: "equation"
)[

Assuming these variables:
- $x$ is the current value of the joystick axis
- $t$ is a constant that controls the steepness of the curve

#text(
size: 15pt
)[
\
$ ( e^(-t/10) + e^( (abs(x)-127)/10) * (1-e^(t/10)) )x $
\
]
]

In code it looks like this:

```cpp
double calcDriveCurve(double input, double scale) {
    if (scale != 0) {
        return (powf(2.718, -(scale / 10)) + powf(2.718, (fabs(input) - 127) / 10) * (1 - powf(2.718, -(scale / 10)))) *
               input;
    }
    return input;
}
```

#nb_heading([Tank Drive], level: 2)

The tank drive implementation is very simple. The values of the joysticks are passed into the calcDriveCurve function, and the into the move method of our motor groups.

```cpp
void tank(int left, int right, float curveGain) {
    leftMotors.move(calcDriveCurve(left, curveGain));
    rightMotors.move(calcDriveCurve(right, curveGain));
};
```

#nb_heading([Arcade Drive], level: 2)

The arcade drive implementation is slightly more complicated. The power of the left and right motors has to be calculated by add or subtracting the turn value from the value of the throttle value.

```cpp
void arcade(int throttle, int turn, float curveGain) {
    int leftPower = calcDriveCurve(throttle + turn, curveGain);
    int rightPower = calcDriveCurve(throttle - turn, curveGain);
    leftMotors.move(leftPower);
    rightMotors.move(rightPower);
};
```


#nb_heading([Curvature Drive], level: 2)

The curvature drive implementation is easily the most complicated of the three. The calculation for the curve breaks down if the turn value is zero, so the code defaults to arcade drive if the turn value is zero.

The code after that is very similar to arcade drive, except instead throttle has $abs("throttle")*"turn"/127$ added or subtracted from it, rather than turn by itself.

```cpp
void curvature(int throttle, int turn, float curveGain) {
    // If we're not moving forwards change to arcade drive
    if (throttle == 0) {
        arcade(throttle, turn, curveGain);
        return;
    }

    double leftPower = throttle + (std::abs(throttle) * turn) / 127.0;
    double rightPower = throttle - (std::abs(throttle) * turn) / 127.0;

    leftPower = calcDriveCurve(leftPower, curveGain);
    rightPower = calcDriveCurve(rightPower, curveGain);

    leftMotors.move(leftPower);
    rightMotors.move(rightPower);
};
```

]
