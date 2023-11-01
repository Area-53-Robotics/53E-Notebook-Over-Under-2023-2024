#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Build: Pushing Robots",
  type: "build",
  start_date: datetime(year: 2023, month: 10, day: 6),
)[

  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    [
      Today we built the wedges.

      1. We cut 2 lengths of C-channel 5 holes long.
      #nb_admonition(
        type: "note",
      )[
        2 of the 4 pieces of C-channel in the CAD are meant to be replaced with the
        drivetrain.
      ]
      2. We then cut a slit into 2 of the C-channels so that the high strength axles
        could properly fold upwards.
      3. We cut a high strength axle into 2 pieces, and drilled holes in the end of each
        one.
      4. We screwed 1 axle into each piece of C-channel.
      5. We unmounted the omni-wheel on the front of the drivetrain in order to get
        access to the C-channel on the side
      6. We screwed the 2 pieces of C-channel to the drivetrain.
      7. We remounted the omni-wheel to the drivetrain.

      #nb_admonition(
        type: "warning",
      )[
        The wedges on one side couldn't be placed due to the tracking wheels. We had to
        cut the back of the C-channel where the wedges were mounted down by one hole in
        order to get them to fit.
      ]
    ],
    [
      #figure(image("./top.jpg"), caption: "Top view")
      #figure(image("./side.jpg"), caption: "Side view")
    ],
  )

  #nb_admonition(
    type: "build",
  )[
    The wedges are complete! We can now test their effectiveness against other
    robots.
  ]
]
