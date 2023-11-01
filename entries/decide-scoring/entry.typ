#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Decide: Scoring Triballs",
  type: "decide",
  start_date: datetime(year: 2023, month: 9, day: 2),
  end_date: datetime(year: 2023, month: 9, day: 4),
)[

  // TODO: add scaling and property list

  We rated each option on:

  - Efficiency on a scale of 1 to 10
  - Stability on a scale of 1 to 10
  - Feasibility on a scale of 1 to 10.

  #nb_decision_matrix(properties: ("Efficiency", "Stability", "Feasibility"), choices: (
    ("Extentable Hook", 7, 4, 9),
    ("Fold Out Flaps", 10, 9, 10),
    ("Shot Out Net", 5, 3, 4),
  ))

  #nb_admonition(
    type: "decision",
  )[
    We chose the fold out flaps. This option is both the most effective in cost of
    actuators and also the simplest design, leading to it being overall the best
    choice.
  ]

  #nb_heading[First Prototype]

  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    [
      Our first prototype was mainly comprised of L-channel. It featured a piston to
      push the L-channel forwards, mounted on the bottom of the drivetrain.

      #nb_admonition(
        type: "warning",
      )[
        While this design was stable and powerful, it exposed the fitting of the piston
        outwards, making it very easy to hit.
      ]

      We decided to discard this design after discovering that there was no other way
      to mount the piston in this position without exposing it.

    ],
    image("./first-prototype.jpg"),
  )

]

#create_entry(
  title: "Decide: Scoring Triballs",
  type: "decide",
  start_date: datetime(year: 2023, month: 9, day: 2), // TODO: correct to date of final cad creation
  end_date: datetime(year: 2023, month: 9, day: 4),
)[

  #nb_heading([Final Design])

  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    figure(image("./iso.png"), caption: "Isometric view"),
    figure(image("./top.png"), caption: "Top view"),
    figure(image("./side.png"), caption: "Side view"),
    figure(image("./front.png"), caption: "Front view"),
  )

  // TODO: add part diagrams and CAD

  #image("./1.png")

  #image("./2.png")

]
