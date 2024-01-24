#import "/packages.typ": notebookinator, codetastic
#import notebookinator: *
#import codetastic: qrcode
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Build: Elevation",
  type: "build",
  date: datetime(year: 2023, month: 11, day: 3),
  author: "Joy Oladimejij",
  witness: "Violet Ridge",
)

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    With a rough sketch of the design complete, we started building.

    1. We cut two pieces of polycarbonate into shape. We didn't have CAD to go off of,
      so we had to approximate.
    2. We mounted the polycarbonate pieces two the catapult.
    3. We placed the robot next to the match load bar, and then adjusted the
      polycarbonate. We made it shorter as needed, and also adjusted the angle.
    4. Once we were happy with our polycarbonate, we cut plate to reinforce it.
  ],
  [
    #figure(image("./IMG_5386.jpg"), caption: [
      Our climbing mechanism approaching the elevation bar.
    ])
  ],
)

#admonition(
  type: "warning",
)[
  This design is super experimental and not very well tested. This is the bare
  minimum we needed to get an elevation, without much refinement or planning. In
  the future we'll need to actually CAD it out, and perform proper testing.
]
