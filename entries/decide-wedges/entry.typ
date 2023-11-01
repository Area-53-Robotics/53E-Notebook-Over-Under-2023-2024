#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Decide: Pushing Robots",
  type: "decide",
  start_date: datetime(year: 2023, month: 9, day: 8),
)[

  We rated the choices by the following criteria:
  - Ease Of Build on a scale of 1 to 5.
  - Widespread Use on a scale of 1 to 5.
  - Use Of Actuators on a scale of 1 to 5.

  #nb_decision_matrix(
    properties: ("Ease Of Build", "Widespread Use", "Use Of Actuators"),
    choices: (("Wedges", 3, 4, 5), ("Plow", 2, 2, 5), ("Arms", 1, 1, 0),),
  )
  #nb_admonition(
    type: "decision",
  )[
    The final decision is to use the wedges. Ultimately, they were the easiest and
    most efficient to use. The wedges are also passive, which means they don't
    require motors or pistons to be put into use.
  ]

  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    figure(image("./iso.png"), caption: "Isometric view"),
    figure(image("./top.png", height: 25%), caption: "Top view"),
    figure(image("./front.png", height: 25%), caption: "Front view"),
    figure(image("./side.png"), caption: "Side view"),
  )

  \

  #nb_heading([Final Design], level: 1)

  #image("./1.png")
  #image("./2.png")

]

