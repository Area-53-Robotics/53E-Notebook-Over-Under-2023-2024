#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Decide: Moving Triballs",
  type: "decide",
  start_date: datetime(year: 2023, month: 9, day: 5),
)[

  We rated each option on the following characteristics:
  - Speed at which they could fire triballs on a scale or 0 to 3
  - Compactness on a scale of 0 to 3
  - Ease of construction on a scale of 0 to 3
  - Reliability on a scale of 0 to 3
  #nb_decision_matrix(
    properties: ("Speed", "Compactness", "Ease of construction", "Reliability"),
    choices: (
      ("Puncher", 3, 3, 2, 2),
      ("Catapult", 3, 2, 3, 3),
      ("Flywheel", 2, 2, 1, 1),
    ),
  )

  #nb_admonition(
    type: "decision",
  )[
    We ended up deciding on the catapult due to its high speed, and because we had
    experience with building catapults from the Spin Up season.
  ]

  #nb_heading("Final Design", level: 1)

  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    figure(caption: "Front View", image("./front.png",width: 90%)),
    figure(caption: "Top View", image("./top.png", width: 90%)),
    figure(caption: "Side View", image("./side.png", width: 90%)),
    figure(caption: "Isometric View", image("./iso.png", width: 90%)),
  )

  #image("./1.png")
  #image("./2.png")
]

