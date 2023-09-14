#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Brainstorm: Moving Triballs",
  type: "brainstorm",
  start_date: datetime(year: 2023, month: 8, day: 5),
)[
  After discussing for a bit we realized that the only mechanism that would be able to meet our goal of being able to get the triballs across the field in under 5s is some kind of shooting mechanism.

  #nb_heading([Options], level: 1)

  #grid(
    columns: 2,
    gutter: 20pt,
    [
    #nb_heading([Puncher], level: 2)
    #nb_pro_con(
      pros: [
      - Powerful (can reliably shoot under goal)
      - Easy to tune
      ],
      cons: [
      - Take up a lot of horizontal space
      ],
    )

    ],
    image("/assets/launchers/puncher.svg"),
    [
    #nb_heading([Catapult], level: 2)

    #nb_pro_con(
      pros: [
      - We have experience building them
      - Powerful enough to shoot under goal
      - Easy to tune
      ],
      cons: [
      - Takes up a lot of space
      ],
    )
    ],
    image("/assets/launchers/catapult.svg"),
    [
    #nb_heading([Flywheel], level: 2)
    #nb_pro_con(
      pros: [
      - Very accurate speed control
      ],
      cons: [
      - Easily burn out if not given enough power
      - Difficult to correctly tune
      ],
    )
    ],
    image("/assets/launchers/flywheel.svg"),
  )

  ]

