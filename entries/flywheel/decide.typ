#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show:  create-body-entry.with(
  title: "Decide: Launcher Rebuild",
  type: "decide",
  start-date: datetime(year: 2023, month: 11, day: 28),
)

We rated each choice by the following properties:
- Ease of building on a scale of 0 to 10. This not only factors in how simple the design is, but also how familiar we are with it.
- Distance launched on a scale of 0 to 5.
- Consistency/Accuracy on a scale of 0 to 5.

#decision-matrix(
  properties: ("Ease of building", "Distance Launched", "Consistency/Accuracy"),
  ("Catapult", 8, 3, 3),
  ("Flywheel", 9, 5, 2),
  ("Puncher", 4, 2, 3),
)

#admonition(type: "decision")[
  We ended up choosing the flywheel due to its incredibly high ease of building. This will help us get it built in time for our next tournament.
]

= CAD Design

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    We opted to use a 4" flex wheel as the wheel for our flywheel.  We would have liked to use a 3" one, but we did not have any available to us.

    This meant that the speed of our flywheel was slightly higher than we would have liked it to be, and reduced the torque.
    
    Triballs are dropped onto the spinning wheel directly by the match loaders. The intake does not work at all with this design.
  ],
  image("./flywheel-wheel.svg", width: 70%),
  image("./flywheel-gear-ratio.png"),
  [
    We ended up with a 30:6 ratio, using sprockets and chain instead of gears. We would have liked to use gears, but they didn't clear the larger flex wheel we were using. This leaves us with a final RPM of 3000.

  ],


)

#image("./technical-drawing-1.png")
