#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Identify: Program Structure",
  type: "identify",
  date: datetime(year: 2023, month: 8, day: 12),
  author: "Felix Hass",
  witness: "Alan Morales",
)

The organization of our codebase is a critical thing to decide early in the
season. It will decide how we can extend our code in the future and will shape
how we approach solving programming problems in the future.

#image("./identify.svg")

= Design Constraints

- The brain only has 1 core, so parallelism #footnote("See glossary") is not
  possible
- The brain can only handle so many running tasks at a time, so tasks must yield
  for a certain amount of time in order to allow other tasks to run
- Devices can only be queried every 10 ms, so this is the limit for how often a
  task can run.

= Design Goals

- Provide a flexible and simple base for us to work with in the future
- Provide an easy method of creating and managing long running tasks so that we
  can run multiple subsystems at the same time.
