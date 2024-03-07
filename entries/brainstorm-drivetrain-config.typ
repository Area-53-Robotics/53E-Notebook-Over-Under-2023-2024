#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Brainstorm: Drivetrain Configuration",
  type: "brainstorm",
  date: datetime(year: 2023, month: 6, day: 19),
  author: "Alan Morales",
  witness: "Violet Ridge",
)

= Gear Ratio, Wheel Size, and Cartridge Type

Now that we had decided on our type of drivetrain we can decide the other
components. We decided on 4 combinations of gear ratio, wheel sizes and motor
cartridge, which are detailed below:
#v(40pt)
#grid(
  columns: (1fr, 1fr),
  gutter: 5pt,
  [
    == 6:3, 4" Wheels, Green Cartridges
    - 400 RPM
    - 6.96 feet/second
    - 14" long
    #pro-con(pros: [
      - very fast
      - large wheels make traversal easier
    ], cons: [
      - low torque
    ])
  ],
  image("/assets/drivetrain/6_3-4.png"),
  [
    == 3:5, 3.25" Wheels, Blue Cartridges
    - 360 RPM
    - 5.1 feet/second
    - 14" long
    #pro-con(pros: [
      - higher torque
    ], cons: [
      - small wheels make traversal difficult
      - slow
    ])

  ],
  image("/assets/drivetrain/3_5-3_25.png"),
  [
    == 3:5, 4" wheels, blue cartridges
    - 360 RPM
    - 6.47 feet/second
    - 14" long
    #admonition(
      type: "warning",
    )[
      This drivetrain was never fully designed because we discovered that the gears
      did not fully mesh. This is an early sign of our working paying off, if we had
      just started building right away we would not have caught this error.
    ]
    #pro-con(pros: [
      - speed
      - compact gears
    ], cons: [
      - low torque
    ])
  ],
  image("/assets/drivetrain/3_5-4.png"),
  [
    == 4:7, 4" wheels, blue cartridges

    - 342 RPM
    - 5.96 feet/second
    - 14" long
    #pro-con(pros: [
      - speed
      - large wheels make traversal easier
    ], cons: [
      - low torque
    ])
  ],
  image("/assets/drivetrain/drivetrain-cad-side.png"),
)
