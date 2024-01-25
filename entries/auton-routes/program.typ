#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#import "/utils.typ"

#show: create-body-entry.with(
  title: "Program: Auton Routes",
  type: "program",
  date: datetime(year: 2024, month: 1, day: 20), 
)

```cpp
chassis.moveToPoint(0, 32, 2000);
chassis.waitUntilDone();
chassis.turnTo(20, 45, 1000);
intake.set_state(lib::IntakeState::Reversed);
pros::delay(1000);
chassis.moveToPose(-30, 28, -22, 2000);
chassis.waitUntilDone();
intake.set_state(lib::IntakeState::Running);
chassis.moveToPose(0, 46, 100, 2000);
pros::delay(1000);
intake.set_state(lib::IntakeState::Reversed);
pros::delay(1000);
intake.set_state(lib::IntakeState::Idle);
chassis.moveToPose(-40, 52, -90, 1000);
intake.set_state(lib::IntakeState::Running);
pros::delay(1500);
chassis.turnTo(30, 45, 1000);
intake.set_state(lib::IntakeState::Reversed);
pros::delay(500);
flaps.set_state(lib::FlapState::Expanded);
chassis.moveToPoint(20, 45, 3000);
```
