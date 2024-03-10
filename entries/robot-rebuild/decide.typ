#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Decide: Robot Rebuild",
  type: "decide",
  date: datetime(year: 2024, month: 1, day: 5),
  author: "Felix Hass",
  witness: "Meghana Noojipady",
)

Upon coming up with some options we rated each one for the following
characteristics on a scale of 1-10:
- Complexity with a weight of 0.5x
- Weight with a weight of 0.6x
- Scoring potential with a weight of 0.9x

#admonition(
  type: "note",
)[
  Stretching the limits of what we can build is one of our goals for this rebuild,
  so complexity is a positive here, rather than a negative.
]

#decision-matrix(
  properties: ( //
    (name: "Complexity", weight: 0.5),
    (name: "Weight", weight: 0.6),
    (name: "Scoring Potential", weight: 0.9),
  ), //
  ("Modular Elevation/Shooting", 3, 7, 9),
  ("PTO to Elevation", 6, 5, 10),
  ("Descore bot", 2, 7, 5),
)

#admonition(
  type: "decision",
)[
  We ended up choosing the PTO to Elevation option due to its incredibly high
  scoring potential and complexity. If we are able to successfully pull this off,
  we would be one of the only teams in 53 history to successfully build a PTO.
]

= Design Overview

Now that we've decided what we want out of our robot, we decided to plan things
out a little more. Here is our final motor distribution:

- 1 motor intake
- 1 motor shooting mechanism
- 6 motor drivetrain
- 6 motor hang
- 2 piston wings

We also decided to make more detailed sketches of our subsystem layout in order
to have a better idea of how they would be arranged before CADing them.

== Drivetrain

The drivetrain is the most important part of our robot, as it lets us drive
around. Having at least a rough idea of how this will look right now is
extremely important because so many subsystems depend on it.

#image("./driveTrainSide2024.svg")

The PTO is the most complicated part of the robot, and interfaces directly with
the drivetrain.

Here's a front view of the drivetrain that gives a better explanation of how the
PTO works:
#image("./driveTrain2024.svg")

== Climb

The actual mechanism for the climbing mechanism is relatively simple. The whole
design uses 3 joints, total. A piston extends to push the mechanism into the
air, and then we hook onto the top of the elevation bar.

#image("./climb2024.svg")

Once we do that, we switch our PTO in order to engage the motors of the
drivetrain with the winch. Then we simply turn our winch until the robot has
been pulled into the air.

== Intake

The intake is incredibly similar to our old design. The flex wheels spin in
either direction to pull in the triballs.

Here's a sketch detailing how it will work:

#image("./intake2024.svg")
