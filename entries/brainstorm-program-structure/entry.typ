#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Brainstorm: Program Structure",
  type: "brainstorm",
  date: datetime(year: 2023, month: 8, day: 12),
  author: "Felix Hass",
  witness: "Violet  Ridge",
)

= Options

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    == Option 1

    This option uses an object oriented approach, and organizes each subsystem into
    a class. Each subsystem is represented by a state machine that behaves
    differently based on the current set state. Each subsystem will run on it's own
    task in order to be able to act on multiple actions asynchronously. Each class
    will follow a singleton #footnote("See glossary.") pattern, and will therefore
    not be constructed more than once.

    #pro-con(pros: [
      - Scales very well
      - Allows multiple subsystems to act without blocking each other
    ], cons: [
      - Overkill for a small codebase
    ])
  ],
  image("./1.svg"),
  [

    == Option 2

    This option uses a procedural approach. It organizes each subsystem into a
    namespace, and creates functions that can be used to interact with the
    underlying devices. This approach is synchronous, meaning when one operation of
    a subsystem is called, execution will be blocked until the operation is
    finished.

    #pro-con(pros: [
      - Scales pretty well
      - Doesn't require in depth understanding of object oriented concepts
    ], cons: [
      - No asynchronous subsystems
    ])
  ],
  image("./2.svg"),
  [

    == Option 3

    This option is by far the simplest, and would be the easiest to implement. This
    approach defines all devices globally, and does not distinguish between
    subsystems, only devices. This means that all devices can be used freely by any
    subsystem. This approach is also synchronous, and is generally not distributed
    across multiple files. This approach is used by most 53 teams, and is generally
    sufficient for a simple program.

    #pro-con(pros: [
      - Very simple to implement
    ], cons: [
      - Difficult to scale
    ])
  ],
  image("./3.svg"),
)
