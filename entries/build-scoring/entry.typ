#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Build: Scoring Triballs",
  type: "build",
  date: datetime(year: 2023, month: 9, day: 9),
  author: "Alan Morales",
  witness: "Violet Ridge",
)

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    We used the following process to build our wedges.

    1. Cut 2 lengths of C-channel to 2 holes long.
    2. Attached aluminum plate to the C-channel.
    3. Mounted the plate to the drivetrain with screws.
    4. Cut 2 lengths of C-channel to 20 holes long.
    5. Put spacers on the inside of the 20 hole long C-channel
    6. Attached the 20 hole long C-channel to the 2 hole long C-channel on the
      drivetrain with a screw joint so that it can rotate freely.
    7. Attached the end of the pistons to the 20 hole long C-channel with another screw
      joint and spacers.
    8. Mounted the other end of the piston to the drivetrain.

  ],
  [
    #image("./iso.jpg")
    #image("./top.jpg")
  ],
)

#admonition(type: "build")[
  The wings are finally complete!
]
