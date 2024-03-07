#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#create-body-entry(
  title: "Build: Intake Rebuild",
  type: "build",
  date: datetime(year: 2024, month: 2, day: 17),
  author: "John Kelley",
  witness: "Violet Ridge",
)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    [
      With the CAD completed, we were able to start working on building the intake.
      #admonition(
        type: "note",
      )[
        We didn't have the correct length c-channel until the last 30 minutes of the
        meeting. This meant we didn't get as much of the build done as we would have
        liked.
      ]

      We got to work on putting the correct spacing on the axle (see the drawing to
      the right).

      + We cut the high strength axle down to size
      + We slid the flex wheels and spacers onto the axle
      + While adding the flex wheels and spacers we also added in the shaft collar and
        the 6T sprocket.
    ],
    image("./axle.png", width: 80%),
  )

  Once we got the c-channel we needed, we cut it down to size, drilled holes for
  the high strength axles, and screwed in bearings. See the diagram below for the
  correct placement.
  #image("./c-channel.png")

  During our next meeting we’ll need to drill holes into a high strength axle at
  the correct places in order to brace the intake correctly, finish the standoff
  bracing behind the spinning axle, and then mount the intake to the robot.
  #figure(caption: [Completed axle], image("./top-axle.jpg", width: 90%))

]

#create-body-entry(
  title: "Build: Intake Rebuild",
  type: "build",
  date: datetime(year: 2024, month: 2, day: 23),
  author: "John Kelley",
  witness: "Violet Ridge",
)[
  #grid(
    columns: (2fr, 3fr),
    gutter: 20pt,
    [
      The first thing we did this meeting was build the gearbox that the motor
      attaches to. This gearbox is pretty simple, it just connects the motor to the
      intake axle with a chain.

      We mostly finished the intake, but we couldn’t correctly drill the holes in the
      high strength axle. We decided to mount the intake to the robot regardless, to
      verify whether our overall design would work or not.
    ], // placerholder
    figure(image("./gearbox.png"), caption: [The gearbox for the motor]),
  )

  Right away, we discovered a few problems. The intake wasn't mounted far out
  enough, and the flex wheels weren't up high enough to bring the flex wheels
  above the triballs.

  To solve these problems we decided to mount the intake farther out. This meant
  we could get the extra reach we needed without changing the original design. We
  also had to add stops to the bottom of the intake to get it to sit higher.

  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt, //
    figure(
      image("./top-partially-assembled.jpg"),
      caption: [Intake without any bracing],
    ),
    figure(
      image("./top-mounted-partially-assembled.jpg"),
      caption: [Partially assembled intake mounted to the robot],
    ),
  )

  Next meeting we'll have to drill high strength axle and complete the bracing on
  the intake.
]

#create-body-entry(
  title: "Build: Intake Rebuild",
  type: "build",
  date: datetime(year: 2024, month: 2, day: 24),
  author: "John Kelley",
  witness: "Violet Ridge",
)[

  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    [
      Today we finished the intake.
      + We got the last part we needed, the high strength axle, and drilled holes in it
        at the correct length
      + We "boxed" the c-channel by adding spacers on the inside of it to make it more
        rigid (see the diagram to the right)
      + We screwed the axle into the intake

      #admonition(
        type: "note",
      )[
        Upon trying out the intake we noticed that the standoff we were using as bracing
        stopped the triballs from entering the intake, so we had to remove it.
      ]
    ],
    image("./bracing.png", width: 75%),
  )

  Due to the reduced structure integrity caused by removing the standoffs. We
  decided to add it back in at the mount point of the intake to make it square
  again. We ran the standoff through high strength pillow bearings, which made the
  mount functionally the same, just with added structural integrity.

  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt, //
    figure(
      caption: [Standoff bracing running through the mount points],
      image("./mounting.jpg", width: 90%),
    ),
    figure( //
      caption: [Completed intake with triball],
      image("./top-assembled.jpg", width: 90%),
    ),
  )

  #admonition(type: "build")[
    The intake is complete! We can now move on to testing.
  ]

]
