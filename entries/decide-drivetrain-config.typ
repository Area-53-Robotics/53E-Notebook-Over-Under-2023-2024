#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Decide: Drivetrain Configuration",
  type: "decide",
  date: datetime(year: 2023, month: 6, day: 19),
  author: "Alan Morales",
  witness: "Violet Ridge",
)

We then rated each configuration for it's speed, strength, and maneuverability
on a scale of 0 to 5.

#decision-matrix(
  properties: ((name: "Speed"), (name: "Strength"), (name: "Maneuverability")),
  ("6:3, 4\" wheels, green cartridges", 5, 2, 3),
  ("3:5, 3.25\" wheels, blue cartridges", 3, 4, 2),
  ("3:5, 4\" wheels, blue cartridges", 0, 0, 0),
  ("4:7, 4\" wheels, blue cartridges", 3.5, 4, 3),
)

#admonition(
  type: "note",
  [
    The 3:5, 4", blue cartridge config was not rated due to it's infeasibility.
  ],
)

#admonition(
  type: "decision",
  [
    We settled on a drivetrain with a 4:7 gear ratio, 4" wheels, and blue
    cartridges, leaving us with a final RPM of 342, and a final speed of 5.96
    feet/second.
  ],
)

= Final Drivetrain Design

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  image("/assets/drivetrain/drivetrain-cad-side.png"),
  image("/assets/drivetrain/drivetrain-cad-top.png"),
)

#colbreak()

//TODO: remove item number, or make the item numbers mean something
#align(center, [
  #image("/assets/drivetrain/part-drawings/1.png")
  #image("/assets/drivetrain/part-drawings/2.png")
  #image("/assets/drivetrain/part-drawings/3.png")
])
