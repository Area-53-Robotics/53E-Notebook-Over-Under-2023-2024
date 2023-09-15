#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Brainstorm: Drivetrain Configuration",
  type: "brainstorm",
  start_date: datetime(year: 2023, month: 6, day: 19),
  [
  #nb_heading(
    [Gear Ratio, Wheel Size, and Cartridge Type],
    level: 1,
  )
  Now that we had decided on our type of drivetrain we can decide the other components. We decided on 4 combinations of gear ratio, wheel sizes and motor cartridge, which are detailed below:
  #v(40pt)
  #grid(
    columns: (1fr, 1fr),
    gutter: 5pt,
    [
    #nb_heading([6:3, 4" wheels, green cartridges], level: 2)
    - 400 RPM
    - 6.96 feet/second
    - 14" long
    #nb_pro_con(
      pros: [
      - very fast
      - large wheels make traversal easier
      ],
      cons: [
      - low torque
      ],
    )
    ],
    image("/assets/drivetrain/6_3-4.png"),
    [
    #nb_heading([3:5, 3.25" wheels, blue cartridges], level: 2)
    - 360 RPM
    - 5.1 feet/second
    - 14" long
    #nb_pro_con(
      pros: [
      - higher torque
      ],
      cons: [
      - small wheels make traversal difficult
      - slow
      ],
    )

    ],
    image("/assets/drivetrain/3_5-3_25.png"),
    [
    #nb_heading([3:5, 4" wheels, blue cartridges], level: 2)
    - 360 RPM
    - 6.47 feet/second
    - 14" long
    #nb_admonition(
      type: "warning",
    )[
      This drivetrain was never fully designed because we discovered that the gears did not fully mesh. This is an early sign of our working paying off, if we had just started building right away we would not have caught this error.
      ]
    #nb_pro_con(
      pros: [
      - speed
      - compact gears
      ],
      cons: [
      - low torque
      ],
    )
    ],
    image("/assets/drivetrain/3_5-4.png"),
    [
    #nb_heading([4:7, 4" wheels, blue cartridges], level: 2)
    - 342 RPM
    - 5.96 feet/second
    - 14" long
    #nb_pro_con(
      pros: [
      - speed
      - large wheels make traversal easier
      ],
      cons: [
      - low torque
      ],
    )
    ],
    image("/assets/drivetrain/drivetrain-cad-side.png"),
  )

  ],
)
