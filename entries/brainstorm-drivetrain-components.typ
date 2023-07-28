#import "/template/entries.typ": *

#create_entry(
  title: "Brainstorming Drivetrain Components",
  type: "brainstorm",
  start_date: datetime(year: 2023, month: 5, day: 12),
  end_date: datetime(year: 2023, month: 6, day: 16),
  [
    #nb_heading([Drivetrain Type], level: 1)

    #grid(
      columns: (1fr, 1fr),
      gutter: 50pt,
      [
        #nb_heading([Tank Drive with Omni Wheels], level: 2)
        #nb_pro_con(
          pros: [
            - turns easily
            - strong traction forwards and backwards
            - simple to build
          ],
          cons: [
            - cannot strafe
            - almost no traction side to side
          ],
        )
      ],
      image("/assets/drivetrain/onmi-drive.svg"),
      [
        #nb_heading([Tank Drive with Traction Wheels], level: 2)
        #nb_pro_con(
          pros: [
            - strong traction forwards and backwards
            - strong traction side to side
            - simple to build
          ],
          cons: [
            - cannot strafe
            - slow turning
          ],
        )
      ],
      image("/assets/drivetrain/traction-drive.svg"),
      [
        #nb_heading(
          [Tank Drive with Traction and Omni Wheels],
          level: 2,
        )
        #nb_pro_con(
          pros: [
            - strong traction forwards and backwards
            - strong traction side to side
            - fast turning
            - simple to build
          ],
          cons: [
            - cannot strafe
          ],
        )
      ],
      image("/assets/drivetrain/traction-onmi-drive.svg"),
      [
        #nb_heading([Mecanum Drive], level: 2)
        #nb_pro_con(
          pros: [
            - can strafe
          ],
          cons: [
            - slow turning
            - low traction
            - complex programming
            - large wheels take up large amount of space
          ],
        )
      ],
      image("/assets/drivetrain/mecanum-drive.svg"),
      [
        #nb_heading([X-Drive], level: 2)
        #nb_pro_con(
          pros: [
            - can strafe
            - very fast
          ],
          cons: [
            - complex programming
            - tilted wheels take up large amount of space
            - low traction
          ],
        )
      ],
      image("/assets/drivetrain/x-drive.svg"),
    )

    #pagebreak()

    #nb_heading([Wheel Size], level: 1)

    There are three different wheel sizes in VEX that are relevant to our drivetrain:

    - 4"
    - 3.25"
    - 2.75"

    Each wheel has a different speed, corresponding to its size, as well as its ability to traverse objects on the field.

    Speed can be calculated like this:

    #nb_admonition(
      type: "equation",
      align(
        center,
        [
          $"Speed" = "Power" * "Torque"$

          \
        ],
      ),
    )

    Power is constant due to the amount of motors we are given, so torque $prop$ to 1/speed. Gaining in one means losing in the other. If we gain speed, we lose torque, and vice versa.

    #image("/assets/drivetrain/wheels.svg", height: 50%)

    #pagebreak()

    #nb_heading([Motor Cartridge], level: 1)

    Motor cartridges go inside the motors, and dictate the motors RPM.

    There are three different types of cartridges, each with differing speeds.
    - Blue (600 RPM)
    - Green (200 RPM)
    - Red (100 RPM)

    Similar to the wheels, torque and speed are inversely proportional, meaning that if a cartridge has more speed, it loses torque.

    #image("/assets/drivetrain/motor-cartridges.svg")
  ],
)
