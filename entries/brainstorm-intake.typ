#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Brainstorm: Intake",
  type: "brainstorm",
  start_date: datetime(year: 2023, month: 8, day: 4),
)[
  #nb_heading([Options], level: 1)
  We decided on three different types of intake

  #grid(
    columns: (1fr, 2fr),
    gutter: 20pt,
    [
      #nb_heading([Claw], level: 2)
      This design uses a pneumatically activated claw to grab the triballs. It has
      passive flex wheels on the end to increase its compression and grip on the
      triballs.
      #nb_pro_con(pros: [
        - Uses pneumatics instead of motors
      ], cons: [
        - Very slow
        - Can run out of air
      ])
    ],
    image("/assets/intakes/claw.svg"),
    [
      #nb_heading([Flex Wheels], level: 2)
      This design uses a top down roller intake design, with flex wheels as the
      rollers.
      #nb_pro_con(pros: [
        - Compresses
      ], cons: [
        - Needs motors
      ])
    ],
    image("/assets/intakes/flex-wheels.svg"),
    [
      #nb_heading([Sprockets and Rubber Bands], level: 2)
      This design uses a top down roller intake design, and has sprockets connected by
      rubber bands as rollers.
      #nb_pro_con(pros: [
        - Compresses a lot
      ], cons: [
        - Needs motors
      ])
    ],
    image("/assets/intakes/sprockets.svg"),
  )
]

