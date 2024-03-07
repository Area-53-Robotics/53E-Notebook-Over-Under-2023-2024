#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Program: Driver Control",
  type: "program",
  date: datetime(year: 2023, month: 10, day: 27),
  author: "Meghana Noojipady",
  witness: "Violet Ridge",
)

We finished the controller layout for all of the subsystems.

Here's an image of the current layout:

#image("./control-layout.svg")

#heading[Implementation]

We decided to rumble the controller every time a button is pressed in order to
give the driver more haptic feedback.

#heading(level: 2)[Intake]

We do not rumble the controller because the intake buttons are held, not
toggles. This would lead to the controller repeatedly rumbling instead of
rumbling once.

```cpp
if (controller.get_digital(pros::E_CONTROLLER_DIGITAL_R1)) {
  intake.set_state(lib::IntakeState::Running);
} else if (controller.get_digital(pros::E_CONTROLLER_DIGITAL_R2)) {
  intake.set_state(lib::IntakeState::Reversed);
} else {
  intake.set_state(lib::IntakeState::Idle);
}
```

#heading(level: 2)[Wings]

The wings control is also a held button press.

```cpp
if (controller.get_digital(pros::E_CONTROLLER_DIGITAL_L1)) {
  flaps.set_state(lib::FlapState::Expanded);
} else {
  flaps.set_state(lib::FlapState::Idle);
}
```

#heading(level: 2)[Catapult]

The code controlling the catapult is much more complex, and cannot be
represented by a single state change, so we've abstracted it with another
method.

```cpp
// Catapult control
if (controller.get_digital(pros::E_CONTROLLER_DIGITAL_L2)) {
  controller.rumble(".");
  catapult.fire();
}

if (controller.get_digital_new_press(pros::E_CONTROLLER_DIGITAL_A)) {
  controller.rumble(".");
  catapult.toggle_repeating();
}
if (controller.get_digital_new_press(pros::E_CONTROLLER_DIGITAL_B)) {
  controller.rumble(".");
  catapult.toggle_disabled();
}
```

#heading(level: 2)[Drivetrain]

Now that LemLib supports driver control functions we can use their functions
instead of our own.

```cpp
// Drivetrain control
int left = controller.get_analog(pros::E_CONTROLLER_ANALOG_LEFT_Y);
int right = controller.get_analog(pros::E_CONTROLLER_ANALOG_RIGHT_Y);

chassis.tank(left, right, 5);
```
This Implementation is overall much cleaner than what we had before.
