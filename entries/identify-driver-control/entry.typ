#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Identify: Driver Control",
  type: "identify",
  start_date: datetime(year: 2023, month: 8, day: 20), // TODO: find correct date
)[

  Letting the driver control the robot is the single most important thing the
  software of the robot needs to do. The driver control period of the match is the
  longest and most important, and almost always decides the final outcome of
  matches.

  In addition being able to control our robot with a controller lets us compete in
  the driver skills section of the tournament.

  #image("./identify-problem.svg")

  #nb_heading([Design Constraints], level: 1)
  - We can only tell the robot to do what is it is physically capable of doing
  - The solution should be fitted to what the driver prefers, not what is
    theoretically optimal

  #nb_heading([Goals], level: 1)
  - Provide a high level of control to the driver
  - Never reduce the functionality of the robot in order to give control

]
