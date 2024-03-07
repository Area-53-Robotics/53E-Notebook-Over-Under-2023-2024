#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Decide: Drivetrain Type",
  type: "decide",
  date: datetime(year: 2023, month: 6, day: 16),
  author: "Alan Morales",
  witness: "Violet Ridge",
)

We placed all our options into a decision matrix in order to find the best
option. We rated each option's speed, strength, and handling on a scale of 0 to
3. Speed is simply how fast the drivetrain can go. Strength is the ability of
the drive to push and resist other robots. It takes into account the torque of
the drive, as well as it's traction.

#decision-matrix(
  properties: ((name: "Speed"), (name: "Strength"), (name: "Handling")),
  ("Omni Wheels", 2.5, 2, 2.5),
  ("Traction Wheels", 2.5, 3, 1),
  ("Traction and Omni Wheels", 2.5, 2.5, 1.5),
  ("Mecanum", 2, 1, 3),
  ("X-Drive", 2.5, 0.5, 3),
)
#admonition(
  type: "decision",
  [
    We ended up choosing the all omni drive due to its great turning and speed.
    While an X drive of the same gearing could be faster, the prevalence of 6 motor
    drivetrains means that any skid-steer chassis will be comparable have a
    comparable speed due to the X-Drive's inability to have more than 4 motors.
  ],
)
