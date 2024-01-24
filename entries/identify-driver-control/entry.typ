#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Identify: Driver Control",
  type: "identify",
  date: datetime(year: 2023, month: 8, day: 20),
  author: "Meghana Noojipady",
  witness: "Alan Morales",
)

Letting the driver control the robot is the single most important thing the
software of the robot needs to do. The driver control period of the match is the
longest and most important, and almost always decides the final outcome of
matches.

In addition being able to control our robot with a controller lets us compete in
the driver skills section of the tournament.

#image("./identify-problem.svg")

= Design Constraints

- We can only tell the robot to do what is it is physically capable of doing
- The solution should be fitted to what the driver prefers, not what is
  theoretically optimal

= Goals

- Provide a high level of control to the driver
- Never reduce the functionality of the robot in order to give control
