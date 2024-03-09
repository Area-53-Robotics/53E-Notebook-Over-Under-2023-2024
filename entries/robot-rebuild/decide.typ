#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Decide: Robot Rebuild",
  type: "decide",
  date: datetime(year: 2024, month: 1, day: 5),
  author: "Felix Hass",
  witness: "Meghana Noojipady",
)

Upon coming up with some options we rated each one for the following
characteristics on a scale of 1-10:
- Complexity with a weight of 0.5x
- Weight with a weight of 0.6x
- Scoring potential with a weight of 0.9x

#admonition(
  type: "note",
)[
  Stretching the limits of what we can build is one of our goals for this rebuild,
  so complexity is a positive here, rather than a negative.
]

#decision-matrix(
  properties: ( //
    (name: "Complexity", weight: 0.5),
    (name: "Weight", weight: 0.6),
    (name: "Scoring Potential", weight: 0.9),
  ), //
  ("Modular Elevation/Shooting", 3, 7, 9),
  ("PTO to Elevation", 6, 5, 10),
  ("Descore bot", 2, 7, 5),
)

#admonition(
  type: "decision",
)[
  We ended up choosing the PTO to Elevation option due to its incredibly high
  scoring potential and complexity. If we are able to successfully pull this off,
  we would be one of the only teams in 53 history to successfully build a PTO.
]

// TODO: put a sketch of the robot design here

