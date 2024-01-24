#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Brainstorm: Scoring Triballs",
  type: "brainstorm",
  date: datetime(year: 2023, month: 9, day: 2),
  author: "Alan Morales",
  witness: "Violet Ridge",
)

// TODO: add images
// TODO: fill out pros and cons

#grid(
  columns: (1fr, 1.5fr),
  gutter: 20pt,
  [
    #heading([Extendable Arm])
    An extendable arm to capture triballs from the loading zone, and pushing
    triballs in with a lexan skirt on the robot.
    #pro-con(pros: [
      - Simple to build
    ], cons: [
      - Inefficient motor use
    ])

  ],
  image("./flaps.svg"),
  [
    #heading([Folding Skirts])

    Skirts that can fold outwards, and shovel triballs in. In addition we can add
    rounded sloped corners on the ends to lift the front of the bot upwards in order
    to help us get over the barrier.
    #pro-con(pros: [
      - Simplest design
      - Allows us to go over the barrier
      - Does not use a motor
    ], cons: [
      - We need to add pneumatic pistons and reservoirs
    ])
  ],
  image("./hook.svg"),
  [
    #heading([Extendable Net])
    An extendable net to go over the triball and pull it inwards.

    #pro-con(pros: [
      - Looks cool
      - Gladiator style points
      - Simple design
    ], cons: [
      - Inefficient motor use
      - May not work
    ])
  ],
  image("./net.svg"),
)
