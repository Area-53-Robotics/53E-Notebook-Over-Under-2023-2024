#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Identify: Pushing Robots",
  type: "identify",
  start_date: datetime(year: 2023, month: 9, day: 3),
)[
  VRC is a very contact heavy robotics competition. We will often be trying to
  push other robots. During the Spin Up season, even with our 6 motor drivetrain,
  we still struggled to push other robots.

  We need to something that will give us an advantage while pushing robots without
  adding more motors to our drivetrain.

  #figure(image("modelone.png", width: 80%))

  #nb_heading([Design Constraints])
  - No active actuators
  - Must use vex materials
  - Has to fit on the robot.
  - Cannot exceed the 18" size limit.

  #nb_heading([Design Goals])
  - Needs to be able to push another larger robot 2 feet while driving into it.
  - Needs to be able to start folded in at the start of the match.
]
