#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show:  create-body-entry.with(
  title: "Identify: Wedges Rebuild",
  type: "identify",
  start-date: datetime(year: 2023, month: 11, day: 29),
)

At our last tournament we discovered a few issues with our wedges. While they were amazing for pushing other robots, they were not so good for pushing triballs. The wedges also do not cover the full length of the robot, and therefore do not protect the tracking wheels whatsoever.

Having the wedges be able to do this would greatly simplify scoring, and would allow us to still score triballs that we don't successfully get across the barrier.

#image("./identify.svg")

= Design Goals

- The design must be able to push triballs over the barrier
- The design must cover the full front of the robot

= Design Constraints

- Design must be completely passive (no actuators)
- Design must obey the functional plastic limit
