#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Decide: Intake Rebuild",
  type: "decide",
  date: datetime(year: 2024, month: 2, day: 16), // TODO: fix date
)

In order to make our final decision as to which option to choose, we rated each
option in the follow categories on scale of 1 to 10:
- Strength integrity with a weight of 1x
- Reliability with a weight of 0.8x
- Ease of fabrication with a weight of 0.5x

We then plotted these options on a decision matrix:

#decision-matrix( //
  properties: ( //
    (name: "Structual Integrity", weight: 1),
    (name: "Reliability", weight: 0.8),
    (name: "Ease of Fabrication", weight: 0.5),
  ),
  ("No Bracing", 2, 4, 8),
  ("High Strength Axle Bracing", 8, 2, 7),
  ("3-Channel Bracing", 6, 5, 4),
)

#admonition(
  type: "decision",
)[
  We ended up choosing an intake with high strength axle bracing due to its
  incredibly high structural integrity. While this will be very difficult to
  build, we think that the trade off is overall worth it.
]

= CAD Breakdown

After deciding on which option we wanted we designed it with CAD.

The intake is driven by sprockets and chain, unlike our old intake which was
directly driven. We do this to be able to change the gear ratio and protect the
motor from harm.

#image("./gear ratio.png", width: 50%)

We opted for a 3:1 gear ratio, giving us a final RPM of 1800. This is mainly to
compensate for the reduced speed of the smaller wheels.

#grid(
  columns: (1fr, 1fr),
  [
    Another essential part of our design is the sleds. These help the intake ride on
    top of the goal so we can push the triballs in with the drivetrain.

    They also serve the dual purpose of protecting the flex wheels inside of the
    intake from harm.
  ],
  image("./sled.png"),
)

#image("./cad-drawing-1.svg")
#image("./cad-drawing-2.svg")
#image("./cad-drawing-3.svg")
