#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Identify: Autonomous Movement",
  type: "identify",
  start_date: datetime(year: 2023, month: 8, day: 29),
)[

  Now that we have position tracking we need to put it to use. Autonomous movement
  is a tricky problem to solve, especially now that we're tracking the robot in 2
  dimensions instead of 1.

  #image("./identify.svg", width: 75%)

  #nb_heading([Design Constraints], level: 1)
  - Cannot be more precise than the position tracking

  #nb_heading([Design Goals], level: 1)
  - Be able to move in a straight line without drifting from side to side.
  - Be able to move to a target point within 0.5" of error.
  - Be able to correct for interference.

]

