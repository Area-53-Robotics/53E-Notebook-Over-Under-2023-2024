#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Identify: Autonomous Movement",
  type: "identify",
  date: datetime(year: 2023, month: 8, day: 29),
  author: "Felix Hass",
  witness: "Alan Morales",
)

Now that we have position tracking we need to put it to use. Autonomous movement
is a tricky problem to solve, especially now that we're tracking the robot in 2
dimensions instead of 1.

#image("./identify.svg", width: 75%)

= Design Constraints

- Cannot be more precise than the position tracking

= Design Goals

- Be able to move in a straight line without drifting from side to side.
- Be able to move to a target point within 0.5" of error.
- Be able to correct for interference.
