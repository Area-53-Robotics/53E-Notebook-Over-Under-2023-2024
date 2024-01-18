#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Decide: Launcher Rebuild",
  type: "decide",
  start-date: datetime(year: 2023, month: 11, day: 29),
)

We rated each option in the following categories:
- Reliability from 0 to 5
- Ease of fabrication from 0 to 5
- Ease of tuning from 0 to 5

#decision-matrix(
  properties: ("Reliability", "Ease of fabrication", "Ease of tuning",),
  ("Rebuild Wedge to use plastic", 1, 3, 2),
  ("Add plastic to Existing Wedges", 3, 1, 3),
  ("Create plastic Flap to Aid Existing Wedges", 2, 2, 1),
)

#admonition(
  type: "decision",
)[
  We ending up choosing to add plastic over our existing wedges. This will provide
  them with the rigidity they need to not break, while still covering the whole
  front length of the bot.
]

= CAD Overview

Our new wedge design is pretty simple. It involves a simple hinged piece that
goes over our current ones. A piece of plastic will be cut out and put over the
half cut to make sure that nothing gets through.

#figure(image("./cad-iso.png", width: 60%), caption: "Isometric view")

We plan to laser cut the plastic cover out of acetal, but we will not get access
to a laser cutter in time to get it cut. For now we'll cut polycarbonate out by
hand and use that.

#image("./technical-drawing-1.png")
