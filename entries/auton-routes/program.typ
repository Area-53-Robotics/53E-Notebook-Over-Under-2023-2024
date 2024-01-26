#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#import "/utils.typ"

#show: create-body-entry.with(
  title: "Program: Offensive Size Auton",
  type: "program",
  date: datetime(year: 2024, month: 1, day: 20),
)

We've started work on implementing our offensive side autonomous routine.

This auton attempts to score 4 triballs into the goal.

First we place our preloaded triball in front of the goal to be scored later.

```cpp
chassis.moveToPoint(0, 32, 2000); // Move forward 32"
chassis.waitUntilDone(); // Wait until the movement is complete
chassis.turnTo(20, 45, 1000); // Turn to face the goal
intake.set_state(lib::IntakeState::Reversed); // Outake the triball
pros::delay(1000); // Wait a second for the triball to leave the intake
```

```cpp
chassis.moveToPose(-30, 28, -22, 2000); //Move to middle bar
chassis.waitUntilDone();
intake.set_state(lib::IntakeState::Running); //Intake Triball
chassis.moveToPose(0, 46, 100, 2000); //Move and face goal
pros::delay(1000);
intake.set_state(lib::IntakeState::Reversed); //Outake Triball
pros::delay(1000);
intake.set_state(lib::IntakeState::Idle); //Set intake to idle
chassis.moveToPose(-40, 52, -90, 1000); //Move to middle bar
intake.set_state(lib::IntakeState::Running); //Intake Triball
pros::delay(1500);
chassis.turnTo(30, 45, 1000); //Turn to face goal
intake.set_state(lib::IntakeState::Reversed); //Outake triball
pros::delay(500);
flaps.set_state(lib::FlapState::Expanded); //Expand flaps
chassis.moveToPoint(20, 45, 3000); //Use flaps to move towards goal and push in all four triballs into goal
```
