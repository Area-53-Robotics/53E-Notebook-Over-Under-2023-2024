#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Decide: Scoring Triballs",
  type: "decide",
  start_date: datetime(year: 2023, month: 9, day: 2),
  end_date: datetime(year: 2023, month: 9, day: 4),
)[

// TODO: add scaling and property list

#nb_decision_matrix(
  properties: ("Efficiency", "Stability", "Plausibility"),
  choices: (
    ("Extentable Hook", 7, 4, 9),
    ("Fold Out Flaps", 10, 9, 10),
    ("Shot Out Net", 5, 3, 4),
  ),
)

#nb_admonition(type: "decision")[
We chose the fold out flaps. // TODO: expand on this
]

#nb_heading([Final Design])

// TODO: add part diagrams and CAD


]
