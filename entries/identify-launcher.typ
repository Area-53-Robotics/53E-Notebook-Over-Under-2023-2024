#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Identify: Moving Triballs",
  type: "identify",
  date: datetime(year: 2023, month: 9, day: 5),
  author: "John Kelley",
  witness: "Violet Ridge",
)

Moving the triballs is vital to our ability to score points. The faster we move
triballs to the opposite side of the field the more points we get. Not only do
we get 2 points per triball that is in our offensive zone, the faster we can
supply triballs to our alliance partner, the faster they can score them into the
goal.
#align(center)[
  #image("../assets/game-challenges/moving-triballs.svg", height: 25%)
]

= Design Constraints

- Needs to use 11Ws of motors or less
- Needs to fit within an 18" by 18" by 18" cube
- If it expands, it cannot make the robot go beyond a vertical size of 36"

= Design Goals

- Be able to move a triball across the field in under 5s
