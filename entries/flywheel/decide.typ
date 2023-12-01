#import "/template/template.typ": *
#show:  create_entry.with(
  title: "Decide: Launcher Rebuild",
  type: "decide",
  start_date: datetime(year: 2023, month: 11, day: 28),
)

We rated each choice by the following properties:
- Ease of building on a scale of 0 to 10. This not only factors in how simple the design is, but also how familiar we are with it.
- Distance launched on a scale of 0 to 5.
- Consistency/Accuracy on a scale of 0 to 5.

#nb_decision_matrix(
  properties: ("Ease of building", "Distance Launched", "Consistency/Accuracy"),
  choices: (
    ("Catapult", 8, 3, 3),
    ("Flywheel", 9, 5, 2),
    ("Puncher", 4, 2, 3),
  ),
)

#nb_admonition(type: "decision")[
  We ended up choosing the flywheel due to its incredibly high ease of building. This will help us get it built in time for our next tournament.
]

= CAD Design



