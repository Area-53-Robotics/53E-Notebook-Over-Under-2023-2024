#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Build: Wedges Rebuild",
  type: "build",
  date: datetime(year: 2023, month: 12, day: 1),
  author: "Violet Ridge",
  witness: "Meghana Noojipady",
)

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    We followed these steps in order to assemble the wedges:

    + We gathered all the materials
    + We cut the half-cut down to size
    + We screwed the half cut to the hinges
    + We placed a piece of polycarbonate on top of the assembly, and marked holes
    + we drilled out the holes, and put screws in them
    + We screwed the polycarbonate to the bottom assembly
    + Wedges

    #admonition(
      type: "note",
    )[
      Our design currently lacks the bottom standoff. We plan to add it in, but we ran
      out of time at our last meeting.
    ]
  ],
  image("./build-1.jpg"),
)

#admonition(
  type: "build",
)[
  The wedges are complete. In the future we'll want to swap out the polycarbonate
  for a piece of acetal.
]
