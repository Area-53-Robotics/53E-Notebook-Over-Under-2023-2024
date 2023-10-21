#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Identify Challenges",
  type: "identify",
  start_date: datetime(year: 2023, month: 5, day: 12),
)[

  #nb_heading([Tasks], level: 1)

  After looking over the rules again we identified several tasks our robot needs
  to be able to complete:
  #grid(
    columns: 2,
    [
      #nb_heading([Traversing the field], level: 2)
      Our robot will need to be able to traverse the field. Not only will it have to
      be able to cross normal tiles, but it will also have to be able to cross the
      barrier in the middle of the field.
    ],
    image("/assets/game-challenges/traversing.svg"),
    image("/assets/game-challenges/scoring-triballs.svg"),
    [
      #nb_heading([Scoring Triballs], level: 2)
      This task should be our highest priority as most of the game elements are
      triballs, and we'll spend most of the game interacting with them. We are not
      allowed to score more than one triball, so we agreed that the speed at which we
      score triballs is very important.
    ],
    [
      #nb_heading([Picking up Triballs], level: 2)
      Picking up triballs is also a very important task, but due to the fact that
      triballs can be loaded directly into our robot at the match load zone this task
      is not as important as it would normally be.
    ],
    image("/assets/game-challenges/picking-up-triballs.svg"),
    image("/assets/game-challenges/moving-triballs.svg"),
    [
      #nb_heading([Moving Triballs], level: 2)

      Moving triballs is essential to our ability to score them. Like the scoring, we
      decided that the highest priority when approaching this task how fast we can
      move them due to our ability to only possess one at a time.
    ],
    [
      #nb_heading([Climbing], level: 2)
      Our robot needs to be able to climb up the elevation bar. The way that this is
      scored is relative to other robots, making this task very important. If we
      manage to get our robot off the ground we aren't just scoring points for our
      alliance, we're also removing points from the opposing alliance.
    ],
    image("/assets/game-challenges/elevation.svg"),
  )
]
