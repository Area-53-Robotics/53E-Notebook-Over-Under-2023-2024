#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Brainstorm: Intake Rebuild",
  type: "brainstorm",
  date: datetime(year: 2024, month: 2, day: 16),
  author: "John Kelley",
  witness: "Violet Ridge",
)

= Choices

Once we identified what we wanted out of our redesign, we came up with some
options to choose from.

#grid(
  columns: (2fr, 3fr),
  gutter: 20pt, //
  [
    == No Bracing

    This option is very similar to one of our earlier intake iterations. It just
    consists of two pieces of c-channel, with an axle in the middle.

    #pro-con(
      pros: [
        - Very easy to build
      ],
      cons: [
        - All of the stress will be put onto the intake's axle, increasing friction
      ],
    )
  ],
  image("./no-bracing.svg"),
  [
    == High Strength Axle Bracing

    This option is the same as the first, but it has a high strength axle providing
    structural support.

    #pro-con(
      pros: [
        - Extremely rigid
      ],
      cons: [
        - Its very difficult to drill holes in a high strength axle accurately.
      ],
    )
  ],
  image("./hs-axle-bracing.svg"),
  [
    == 3-channel Bracing

    This option swaps the high strength axle out for a piece of 3-channel.

    #pro-con(pros: [
      - Easy to build
    ], cons: [
      - Not as rigid as a high strength axle
    ])
  ],
  image("./c-channel-bracing.svg"),
)
