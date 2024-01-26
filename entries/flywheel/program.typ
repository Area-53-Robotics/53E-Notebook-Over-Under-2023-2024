#import "/packages.typ": notebookinator, codetastic
#import notebookinator: *
#import themes.radial.components: *

#import codetastic: qrcode

#show: create-body-entry.with(
  title: "Program: Flywheel",
  type: "program",
  date: datetime(year: 2023, month: 11, day: 28), // TODO: fix date
  author: "Felix Hass",
  witness: "Meghana Noojipady",
)

= PID Control

When we were programming our flywheel we wanted the velocity to be as consistent
as possible. In order to do this we decided to use a library called Sylib #footnote(qrcode("https://github.com/sy1vi3/sylib", size: 2pt)) which
was commonly used during the Spin Up season. It contains a workaround to a bug
in the V5 firmware that allows us to more accurately measure the velocity of the
flywheel.

With Sylib installed, we need to configure our PID constants.

```cpp
inline sylib::SpeedControllerInfo flywheel_speed_controller(
    [](double rpm) { return 5; },  // kV function
    1,                             // kP
    1,                             // kI
    1,                             // kD
    1,                             // kH
    false,                         // anti-windup enabled
    0,                             // anti-windup range
    false,                         // p controller bounds threshold enabled
    0,                             // p controller bounds cutoff enabled
    1,                             // kP2 for when over threshold
    0                              // range to target to apply max voltage
);
```
With this set up the code to maintain the flywheel speed is extremely simple.

```cpp
switch (get_state()) {
  case FlywheelState::Idle:
    motor->stop();
    break;
  case FlywheelState::Spinning:
    motor->set_velocity_custom_controller(600);
    break;
}
```

We've set up the flywheel to be toggled with the L2 button, replacing the
catapult. ```cpp
// Flywheel control
if (controller.get_digital_new_press(pros::E_CONTROLLER_DIGITAL_L2)) {
 controller.rumble(".");
 flywheel.toggle();
 }
``` This is overall easier for the driver, it means they don't have to think
about holding down a button the whole time the flywheel is running.

This PID output can be graphed with the Loginator. This allows for easy
debugging and testing.
#figure(
  image("./loginator-output.png"),
  caption: [Grafana, displaying PID output from the flywheel],
)

The dips represent the output of the controller as the flywheel was toggled on
and off.

= LED Indicator

When we were match loading during our Hereford tournament we noticed that it was
very difficult for the match loaders to know when the flywheel was back up to
speed again. This lead to very inconsistent trajectories.

We decided to add an LED indicator light to show the match loaders when the
flywheel was spinning fast enough.

Implementing this was simple enough, Sylib also provides built in LED control.
These 5 lines of code were all we needed to get this working. ```cpp
if (motor->get_velocity_error() > 50) {
 led->set_all(RED);
} else {
 led->set_all(GREEN);
}
```
