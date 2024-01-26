#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Brainstorm: Elevation",
  type: "brainstorm",
  date: datetime(year: 2024, month: 1, day: 03),
  author: "John Kelley",
  witness: "Violet Ridge",
)

= Choices

There were several different options regarding the hang and how to lift our
robot to B tier.

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    == Piston Lift

    #pro-con(pros: [
      - Does not require motors
      - Easy for driver to use
      - Can elevate shooting mechanism
    ], cons: [
      - Effectiveness could be reduced if pressure is lowered during match
      - Requires pneumatics
    ])
  ],
  image("./piston.svg"),
  [
    == Balance Mechanism

    A small protrusion, deployed during a match, could allow the driver to balance
    the robot on the barrier. This would ideally be passive.

    #pro-con(pros: [
      - Does not require any actuators, pneumatics or motors.
      - Can be used in multiple locations on the barrier.

    ], cons: [
      - Hard to use for driver
      - Very limited in height of hang
      - Puts large amounts of strain on robot

    ])
  ],
  image("./balance.svg"),
  [
    == PTO Lift

    Power from drivetrain motors could be moved to power a lever which could lift
    the robot. Moving the power would require PTO.

    #pro-con(pros: [
      - Could allow for a very high hang
      - Uses motors which would otherwise be dead weight in a hang

    ], cons: [
      - Very hard to design and fabricate
      - Experience in PTO is very limited
      - Many points of failure

    ])
  ],
  image("./pto.svg"),
)
