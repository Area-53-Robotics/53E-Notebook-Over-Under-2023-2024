#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Brainstorm: Intake",
  type: "brainstorm",
  date: datetime(year: 2023, month: 8, day: 4),
  author: "John Kelley",
  witness: "Alan Morales",
)

= Options

We decided on three different types of intake

#grid(
  columns: (1fr, 2fr),
  gutter: 20pt,
  [
    == Claw

    This design uses a pneumatically activated claw to grab the triballs. It has
    passive flex wheels on the end to increase its compression and grip on the
    triballs.
    #pro-con(pros: [
      - Uses pneumatics instead of motors
    ], cons: [
      - Very slow
      - Can run out of air
    ])
  ],
  image("/assets/intakes/claw.svg"),
  [
    == Flex Wheels

    This design uses a top down roller intake design, with flex wheels as the
    rollers.
    #pro-con(pros: [
      - Compresses
    ], cons: [
      - Needs motors
    ])
  ],
  image("/assets/intakes/flex-wheels.svg"),
  [
    == Sprockets and Rubber Bands

    This design uses a top down roller intake design, and has sprockets connected by
    rubber bands as rollers.
    #pro-con(pros: [
      - Compresses a lot
    ], cons: [
      - Needs motors
    ])
  ],
  image("/assets/intakes/sprockets.svg"),
)
