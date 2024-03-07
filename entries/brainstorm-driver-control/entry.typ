#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Brainstorm: Driver Control",
  type: "brainstorm",
  date: datetime(year: 2023, month: 8, day: 20),
  author: "Meghana Noojipady",
  witness: "Alan Morales",
)

= Options

There are many different types of control schemes for controlling the chassis of
the robot. All of these methods two of the joysticks on the controller to
control the chassis. The controller has 4 axes which can each be read from
separately:
- Left x axis
- Left y axis
- Right x axis
- Right y axis

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    == Tank Drive

    This control scheme uses the left y axis to control the left half of the
    drivetrain, and the right x axis to control the right half of the drivetrain. In
    order to turn the drivetrain the driver moved one half of the drivetrain
    forward, and the other half backward.
    #pro-con(pros: [
      - High level of control
      - Our driver is already experienced with it
    ], cons: [
      - Difficult to drive in a straight line
    ])
  ],
  image("./tank-drive.svg"),
  [
    == Arcade Drive

    This control scheme uses the left y axis to control forward and backward
    movement, and the right x axis to control turning.
    #pro-con(pros: [
      - Very easy to drive in a straight line
    ], cons: [
      - Lower level of control overall
    ])

  ],
  image("./arcade-drive.svg"),
)

#colbreak()

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    == Curvature Drive

    This control scheme is very similar to arcade drive, except the right x axis
    controls the radius of the curve that the robot is traveling along, instead of
    turning power. This means that the driver can change speed with the left
    joystick without changing how sharply they are turning.
    #pro-con(pros: [
      - Very easy to drive in a straight line
      - Better control during turns.
    ], cons: [
      - Lower level of control overall
    ])
  ],
  image("./curvature-drive.svg"),
)
