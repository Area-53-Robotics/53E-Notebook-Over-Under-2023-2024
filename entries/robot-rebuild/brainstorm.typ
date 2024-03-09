#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *
#import "/utils.typ": grid

#show: create-body-entry.with(
  title: "Brainstorm: Robot Rebuild",
  type: "brainstorm",
  date: datetime(year: 2024, month: 1, day: 5),
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
  [ //
    == Modular Shooting Mechanism/Elevation

    Since a low tier hang mechanism and a shooting mechanism typically aren't used
    together, we thought we could make them detachable. This way we could only use
    what we need.

    #pro-con(pros: [
      - Only field what subsystems we need at the time (no extra weight)
    ], cons: [
      - Swapping subsystems will take time
    ]) ],
  image("/entries/robot-rebuild/modular.svg"),
 

  [
    == PTO to Elevation
    This design uses the power of the drivetrain in order to pull the robot into the
    air with a winch. We would use a power transfer off (PTO) to engage the
    drivetrain to the winch, only at the end of the match.
    #pro-con(pros: [
      - Very high hang potential
      - No need to swap subsystems
      - Complicated to build
    ], cons: [
      - Shooting mechanism is mounted during match play 
    ])

  ],
  image("/entries/robot-rebuild/motor.svg"),

   // TODO: put image here
  [
    == Descore Bot
    This bot is as flat as possible to fit under the goal.
    #pro-con(pros: [
      - Good for match play
    ], cons: [
      - Very simple to build
      - Only good for match play

    ])

  ],
  image("/entries/robot-rebuild/descore.svg"), 
)
