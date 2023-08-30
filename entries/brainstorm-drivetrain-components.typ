#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Brainstorm: Drivetrain Components",
  type: "brainstorm",
  start_date: datetime(year: 2023, month: 5, day: 12),
  end_date: datetime(year: 2023, month: 6, day: 16),
  [
  #nb_heading([Drivetrain Type], level: 1)

  #grid(
    columns: (1fr, 1fr),
    gutter: 50pt,
    [
    #nb_heading([Skid Steer with Omni Wheels], level: 2)
    This design uses a simple skid steer #footnote("See glossary.") design, much like what is found on many types of small front loader vehicles. In order to mitigate the issues with dragging wheels on the ground while turning this drivetrain uses omni wheels, which can be pushed side to side as well as forward and backwards.
    #nb_admonition(
      type: "note",
    )[
      The ability to strafe refers to the drivetrain's ability to actively move side to side, and this design can only move sideways passively.
      ]
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
    image("/assets/drivetrain/omni-drive.svg"),
    [

    #nb_heading([Skid Steer with Traction Wheels], level: 2)
    This design is the same as the one above, except the omni wheels are swapped for traction wheels.
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
      [Skid Steer with Traction and Omni Wheels],
      level: 2,
    )
    This design combines the strengths of both of the previous drivetrains. It can turn easily, but it very difficult for other robots to push from the side.
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
    This drivetrain is constructed in the same way as a skid steer chassis, but it uses mecanum wheels instead. This is a holonomic chassis, which means that it can move in any direction without needing to be facing in that direction.
    #nb_pro_con(
      pros: [
      - can strafe
      ],
      cons: [
      - slow turning
      - low traction
      - complex programming
      - wheels take up large amount of space
      ],
    )
    ],
    image("/assets/drivetrain/mecanum-drive.svg"),
    [
    #nb_heading([X-Drive], level: 2)
    This drivetrain is the most unique on this list because of its frame. It is a holonomic chassis, which means that is has the same freedom of movement as the mecanum drive. However, it uses omni wheels at 45$degree$ angles instead of mecanum wheels.
    #nb_admonition(
      type: "warning",
    )[
      This drivetrain is very difficult to build correctly, and usually requires custom plastic pieces #footnote[See #link("https://wiki.purduesigbots.com/hardware/misc.-vex-parts#plastic-gussets") for more information.] in order get the angles to line up.
      ]
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
      [
      $ "Speed" = "Power" * "Torque" $
      \
      ],
  )

  Power is constant due to the amount of motors we are given, so torque $prop$ to 1/speed. Gaining in one means losing in the other. If we gain speed, we lose torque, and vice versa.

  #image("/assets/drivetrain/wheels.svg", height: 50%)

  #pagebreak()

  #nb_heading([Motor Cartridge], level: 1)

  Motor cartridges go inside the motors, and dictate the motors RPM.
  #nb_admonition(
    type: "note",
  )[
    Internally, motor cartridges are just sets of gears, meaning they follow the same rules as normal gear ratios do. This means that they cannot change the power of a motor, only its torque to speed ratio.
    ]

  There are three different types of cartridges, each with differing speeds.
  - Blue (600 RPM)
  - Green (200 RPM)
  - Red (100 RPM)

  #image("/assets/drivetrain/motor-cartridges.svg")
  ],
)
