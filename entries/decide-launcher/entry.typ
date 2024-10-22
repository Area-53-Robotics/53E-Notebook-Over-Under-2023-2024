#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Decide: Moving Triballs",
  type: "decide",
  date: datetime(year: 2023, month: 9, day: 5),
  author: "John Kelley",
  witness: "Violet Ridge",
)

We rated each option on the following characteristics:
- Speed at which they could fire triballs on a scale or 0 to 3
- Compactness on a scale of 0 to 3
- Ease of construction on a scale of 0 to 3
- Reliability on a scale of 0 to 3
#decision-matrix(
  properties: (
    (name: "Speed"),
    (name: "Compactness"),
    (name: "Ease of construction"),
    (name: "Reliability"),
  ),
  ("Puncher", 3, 3, 2, 2),
  ("Catapult", 3, 2, 3, 3),
  ("Flywheel", 2, 2, 1, 1),
)

#admonition(
  type: "decision",
)[
  We ended up deciding on the catapult due to its high speed, and because we had
  experience with building catapults from the Spin Up season.
]

= Final Design

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  figure(caption: "Front View", image("./front.png", width: 90%)),
  figure(caption: "Top View", image("./top.png", width: 90%)),
  figure(caption: "Side View", image("./side.png", width: 90%)),
  figure(caption: "Isometric View", image("./iso.png", width: 90%)),
)

#image("./1.png")
#image("./2.png")
