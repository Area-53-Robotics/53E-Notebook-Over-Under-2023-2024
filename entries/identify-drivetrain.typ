#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Identify Problem: Drivetrain",
  type: "identify",
  start_date: datetime(year: 2023, month: 5, day: 12),
)[
  The drivetrain is the most essential component of our robot. It lets us traverse the field, and is the base for all of our other subsystems. Ever single season besides Nothing But Net has needed a drivetrain, so we assumed that we'd need one for this season as well.

  #align(
    center,
  )[
    #image(
      "/assets/game-challenges/traversing.svg",
      height: 35%,
    )
    ]

  #nb_heading([Design Constraints], level: 1)
  - The drivetrain must fit inside an 18" by 18" by 18" cube.
  - The drivetrain must use no more than 66Ws of motors.

  #nb_heading([Design Goals], level: 1)
  - A speed faster than our drivetrain from Spin Up (4.25 f/s)
  - Bracing that keeps all essential structure of the drivetrain square
  - The ability to cross the barrier
  ] 
