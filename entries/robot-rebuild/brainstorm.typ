#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *
#import "/utils.typ": grid

#show: create-body-entry.with(
  title: "Brainstorm: Robot Rebuild",
  type: "brainstorm",
  date: datetime(year: 2024, month: 3, day: 5),
  author: "Felix Hass",
  witness: "Meghana Noojipady",
)

= Options

Originally it seemed like having our robot be optimized for both skills and
match play seemed like a conflict of interest. Match play almost never uses
shooting mechanisms, and if your elevation tier isn't above A tier, then
elevating during skills is also useless.

We came up with some options to reduce the amount of compromise we'd have to
make:

#grid( //
  columns: (1fr, 1fr),
  [ //
    == Modular Shooting Mechanism/Elevation

    Since a low tier hang mechanism and a shooting mechanism typically aren't used
    together, we thought we could make them detachable. This way we could only use
    what we need.

    This design seems like the best balance between simplicity and competitive
    viability. While there are maybe more optimal configurations, they are also more
    complex, and will take longer to build/debug.

    #pro-con(pros: [
      - Only field what subsystems we need at the time (no extra weight)
    ], cons: [
      - Swapping subsystems will take time
    ]) ],
  image("./modular.svg", width: 70%),
  [
    == PTO to Elevation

    This design uses a power transfer off (PTO) to transfer the power of the
    drivetrain to the elevation mechanism at the end of the match.

    This is a design we considered earlier in the season, but we decided we didn't
    have enough time to complete it.

    With a lot more power to work with this design can pull the robot much farther
    into the air than any of our other ideas so far. This also means that the
    elevation mechanism becomes useful during both match play and skills.

    #pro-con(pros: [
      - Very high hang potential
      - No need to swap subsystems
    ], cons: [
      - Shooting mechanism is mounted during match play
      - Complicated to build
    ])

  ],
  image("./pto.svg", width: 70%),
  [
    == Descore Bot

    This bot is as flat as possible to fit under the goal. This bot layout would be
    extremely simple and generally only useful during matches. It lacks a shooting
    mechanism, and prioritizes a fast and small drivetrain over everything else.

    #pro-con(pros: [
      - Good for match play
    ], cons: [
      - Very simple to build
      - Doesn't perform well during skills
    ])

  ],
  image("./descore.svg"),
)
