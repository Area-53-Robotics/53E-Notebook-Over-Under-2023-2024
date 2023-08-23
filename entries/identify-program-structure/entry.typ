#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
title: "Identify: Program Structure",
type: "identify",
start_date: datetime(year: 2023, month: 8, day: 12)
)[
The organization of our codebase is a critical thing to decide early in the season. It will decide how we can extend our code in the future and will shape how we approach solving programming problems in the future.

#image("./identify.svg")

#nb_heading([Design Constraints], level: 1)
- The brain only has 1 core, so parallelism #footnote("See glossary") is not possible
- The brain can only handle so many running tasks at a time, so tasks must yield for a certain amount of time in order to allow other tasks to run
- Devices can only be queried every 10 ms, so this is the limit for how often a task can run.

#nb_heading([Design Goals], level: 1)
- Provide a flexible and simple base for us to work with in the future
- Provide an easy method of creating and managing long running tasks so that we can run multiple subsystems at the same time.
]

