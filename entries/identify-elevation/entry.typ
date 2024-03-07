#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Identify: Elevation",
  type: "identify",
  date: datetime(year: 2023, month: 11, day: 3),
  author: "Joy Oladimejij",
  witness: "Violet Ridge",
)

Elevation is a key part of scoring points that our robot cannot currently do. We
have reached the limit of allowed motors, meaning that we need to come up with a
mechanism that is either passive or can be powered by pistons.

#image("./identify.svg", width: 50%)

#heading[Design Constraints]
- Must be either passive or use pistons
- Must keep the bot within the 18" sizing restrictions

#heading[Design Goals]

We don't anticipate very many robots in our region to be able to climb, so we
don't need to go for the highest possible climb, we just need to be able to.
Since the elevations are scored relative to other robots this should give us the
same amount of points regardless.

- Needs to be able to achieve an elevation of the lowest tier in under 10 seconds
- Needs to be able to be built in a single meeting
