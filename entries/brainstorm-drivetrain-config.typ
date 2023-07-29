#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Brainstorm Drivetrain Configuration",
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
        - 7 feet/second
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
      image("/assets/drivetrain/6:3-4.png"),
      [
        #nb_heading([3:5, 3.25" wheels, green cartridges], level: 2)
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
      image("/assets/drivetrain/3:5-3_25.png"),
      [
        #nb_heading([3:5, 4" wheels, green cartridges], level: 2)
        - 360 RPM
        - 6.47 feet/second
        - 14" long
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
      image("/assets/drivetrain/3:5-4.png"),
      [
        #nb_heading([4:7, 4" wheels, green cartridges], level: 2)
        - 342 RPM
        - 6.17 feet/second
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
      image("/assets/drivetrain/4:7-4.png"),
    )

  ],
)
