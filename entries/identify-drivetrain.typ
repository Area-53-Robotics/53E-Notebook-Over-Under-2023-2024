#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Identify Problem: Drivetrain",
  type: "identify",
  date: datetime(year: 2023, month: 5, day: 12),
  author: "Alan Morales",
  witness: "Violet Ridge",
)

The drivetrain is the most essential component of our robot. It lets us traverse
the field, and is the base for all of our other subsystems. Ever single season
besides Nothing But Net has needed a drivetrain, so we assumed that we'd need
one for this season as well.

#align(center)[
  #image("/assets/game-challenges/traversing.svg", height: 35%)
]

= Design Constraints

- The drivetrain must fit inside an 18" by 18" by 18" cube.
- The drivetrain must use no more than 66Ws of motors.

= Design Goals

- A speed faster than our drivetrain from Spin Up (4.25 f/s)
- Bracing that keeps all essential structure of the drivetrain square
- The ability to cross the barrier
