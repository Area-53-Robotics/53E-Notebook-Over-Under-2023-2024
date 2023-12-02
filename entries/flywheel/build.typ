#import "/template/template.typ": *

#show:  create_entry.with(
  title: "Build: Launcher Rebuild",
  type: "build",
  start_date: datetime(year: 2023, month: 11, day: 29),
)

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    #nb_admonition(type: "warning")[
      We made several changes to the design that differ from the original CAD.
      - We changed the sprockets from 30 tooth to 24 tooth
      - We doubled up the sprockets for redundancy
    ]

    We used the following steps to build the flywheel:

    + Gathered all materials
    + Cut the two pieces of C-channel down to size
    + Screwed in a bearing block to the top each one
    + Screwed a bearing block on the bottom of one C-channel, and a motor cap to the other.
    + Threaded an axle through the top bearings.
    + Attached the flex wheel and two 6 tooth sprockets to the axle.
    + Threaded an axle through the bottom bearing and motor cap.
    + Attached two 24 tooth sprockets to the bottom axle.
    + Bound the sprockets together with chain.

    We're pleasantly suprised by how easy this design was to put together compared to the catapult.
  ],
  [
    #image("./build-1.jpg")
    #image("./build-2.jpg")
  ],

)
