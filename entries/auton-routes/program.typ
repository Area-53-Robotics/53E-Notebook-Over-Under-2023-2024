#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#import "/utils.typ"

#show: create-body-entry.with(
  title: "Program: Offensive Size Auton",
  type: "program",
  date: datetime(year: 2024, month: 1, day: 20),
  author: "Meghana Noojipady",
  witness: "Felix Hass",
)

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    After the Capital Belt Challenge we discovered that most of our alliance
    partners were incapable of performing AWP with us. This lead us to prioritize
    scoring triballs over scoring AWP. We came up with this route that will score 4
    triballs into the goal.

    + We drop our preloaded triball off in front of the goal
    + We pick up the triball to the robot's left
    + We drop that triball next to the first one
    + We pick up the triball touching the barrier on the auton line
    + We drop the triball next to the first two
    + We extend our wings, and push all 4 triballs into the goal

  ],
  figure(image("./4-ball.png"), caption: "Our new offensive side auton route"),
)

// typstfmt::off
#grid(
  columns: (2fr, 1fr),
  gutter: 20pt,
  [
  ```cpp
  chassis.moveToPoint(0, 32, 2000); // Move forward 32"
  chassis.waitUntilDone(); // Wait until the movement is complete
  chassis.turnTo(20, 45, 1000); // Turn to face the goal
  intake.set_state(lib::IntakeState::Reversed); // Outake the triball
  pros::delay(1000); // Wait a second for the triball to leave the intake
  ```
  ],
  image("./1.png"),
  [
  ```cpp
  chassis.moveToPose(-30, 28, -22, 2000); // Move to middle bar
  chassis.waitUntilDone();
  intake.set_state(lib::IntakeState::Running); // Intake Triball
  ```

  ],
  image("./2.png"),
  [
  ```cpp
  chassis.moveToPose(0, 46, 100, 2000); // Move and face goal
  pros::delay(1000);
  intake.set_state(lib::IntakeState::Reversed); // Outake Triball
  ```

  ],
  image("./3.png"),
  [

  ```cpp
  pros::delay(1000);
  intake.set_state(lib::IntakeState::Idle); // Set intake to idle
  chassis.moveToPose(-40, 52, -90, 1000); // Move to middle bar
  intake.set_state(lib::IntakeState::Running); // Intake Triball
  pros::delay(1500);
  ```

  ],
  image("./4.png"),
  [

  ```cpp
  chassis.turnTo(30, 45, 1000); // Turn to face goal
  intake.set_state(lib::IntakeState::Reversed); // Outake triball
  pros::delay(500);
  flaps.set_state(lib::FlapState::Expanded); // Expand flaps
  chassis.moveToPoint(20, 45, 3000); // Use flaps to move towards goal and push in all four triballs into goal
  ```

  ],
  image("./5.png"),
)
// typstfmt::on
