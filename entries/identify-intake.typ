#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Identify Problem: Intaking Triballs",
  type: "identify",
  date: datetime(year: 2023, month: 8, day: 5),
  author: "John Kelley",
  witness: "Violet Ridge",
)

In order to be able to manipulate the triballs inside our robot, we will first
need to bring them inside our robot. While these are normally extremely
essential to every season, this season they are less important due to the fact
that triballs can be loaded directly into the robot when its touching the match
load zone.

#align(
  center,
)[
  #image("../assets/game-challenges/picking-up-triballs.svg", height: 25%)
]

= Design Constraints

- needs to use 11Ws of motors or less
- needs to fit within an 18" by 18" by 18" cube
- if it expands, it cannot make the robot go beyond a vertical size of 36"

= Design Goals

- Can intake a triball in at least 2s
- Can intake triballs out of the match load zone
