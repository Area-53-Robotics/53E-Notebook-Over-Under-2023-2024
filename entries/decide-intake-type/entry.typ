#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Decide: Intake Type",
  type: "decide",
  start_date: datetime(year: 2023, month: 8, day: 4),
)[

  We rated each option on a scale of 1 to 5 for compression, and a scale of 1 to 3 for speed. The reason we rated compression so high is due to the triballs irregular shape, we need an intake that can easily conform to their shape.

  #nb_decision_matrix(properties: ("Compression", "Speed"), choices: (
    ("Claw", 2, 1),
    ("Flex Wheels", 3, 3),
    ("Sprockets and Rubber Bands", 5, 3),
  ))

  #nb_admonition(
    type: "decision",
  )[
    We choose the intake design with sprockets and rubber bands due to its speed, and more importantly its very high compression.
    ]

  #nb_heading([Final Design], level: 1)

  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    figure(
      caption: "Front View",
      image("./front.png"),
    ),
    figure(
      caption: "Back View",
      image("./back.png"),
    ),
    figure(
      caption: "Side View",
      image("./side.png"),
    ),
    figure(
      caption: "Isometric View",
      image("./iso.png"),
    ),

)

  #image("/assets/intakes/part-drawings/1.png")
  #image("/assets/intakes/part-drawings/2.png")
  #image("/assets/intakes/part-drawings/3.png")


  ]





