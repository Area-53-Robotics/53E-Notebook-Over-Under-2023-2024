#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#create-body-entry(
  title: "Build: Intake Rebuild",
  type: "build",
  date: datetime(year: 2024, month: 2, day: 17),
)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    [#lorem(100)],
    image("./axle.png", width: 80%),
  )

  #lorem(20)
  #image("./c-channel.png")

  #lorem(20)

  #figure(caption: [Completed axle], image("./top-axle.jpg"))

]

#create-body-entry(
  title: "Build: Intake Rebuild",
  type: "build",
  date: datetime(year: 2024, month: 2, day: 23),
)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    [#lorem(100)], // placerholder
    figure(
      image("./top-partially-assembled.jpg"),
      caption: [Intake without any bracing],
    ),
  )
  #figure(
    image("./top-mounted-partially-assembled.jpg", width: 60%),
    caption: [Partially assembled intake mounted to the robot],
  )

]

#create-body-entry(
  title: "Build: Intake Rebuild",
  type: "build",
  date: datetime(year: 2024, month: 2, day: 24),
)[

  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    [#lorem(50)],
    image("./bracing.png", width: 75%),
  )

  #lorem(20)

  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt, //
    figure(
      caption: [Standoff bracing running through the mount points],
      image("./mounting.jpg"),
    ),
    figure( //
      caption: [Completed intake with triball],
      image("./top-assembled.jpg"),
    ),
  )

]
