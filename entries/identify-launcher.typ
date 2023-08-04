#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Identify Problem: Moving Triballs",
  type: "identify",
  start_date: datetime(year: 2023, month: 8, day: 5),
)[
  Moving the triballs is vital to our ability to score points. The faster we move triballs to the opposite side of the field the more points we get. Not only do we get 2 points per triball that is in our offensive zone, the faster we can supply triballs to our alliance partner, the faster they can score them into the goal.
  #align(
    center,
  )[
    #image(
      "../assets/game-challenges/moving-triballs.svg",
      height: 25%,
    )
    ]

  #nb_heading([Design Constraints], level: 1)
  - needs to use 11Ws of motors or less
  - needs to fit within an 18" by 18" by 18" cube
  - if it expands, it cannot make the robot go beyond a vertical size of 36"

  #nb_heading([Design Goals], level: 1)
  - be able to move a triball across the field in under 5s
  ]
