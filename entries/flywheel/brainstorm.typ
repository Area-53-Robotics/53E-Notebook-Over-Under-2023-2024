#import "@local/notebookinator:0.1.0": *
#import themes.radial.components: *

#import "@preview/codetastic:0.2.2": qrcode
#show: create_body_entry.with(
  title: "Brainstorm: Launcher Rebuild",
  type: "brainstorm",
  start_date: datetime(year: 2023, month: 11, day: 28),
)

There are several different options we could choose from when it comes to
shooting mechanisms.

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    == Continue with Catapult

    A shooting mechanism that uses a fulcrum to launch projectiles. We are already
    using a catapult, but it is not shooting far enough or consistently enough to be
    reliable, so we would have to make many design changes.

    #pro_con(
      pros: [
        - We already have a catapult in place
        - Would be familiar
        - The elevation mechanism is attached to the catapult and we would not have to
          redesign that
      ],
      cons: [
        - We don’t understand what we would have to do to make the catapult work better.
        - The catapult is tall
        - The weight of the robot is distributed incorrectly because of the catapult,
          making it unstable.
      ],
    )
  ],
  image("./catapult.svg"),
  [
    == Flywheel

    A flywheel is a kinetic energy battery that spins to build up energy and then
    transfers it to a projectile. This design consists of a single vertical spinning
    wheel that we can drop the triballs directly on to. This design was inspired by
    team 5203G's bot at the Haunted signature event #footnote[
      #qrcode("https://www.youtube.com/watch?v=FwUk5V6V3U4", size: 2pt)
    ]
    #pro_con(
      pros: [
        - The team has experience building flywheels from last year
        - The mechanism is simpler than other options
        - This design would not take much time to build and quality would not be lost
          because of the deadline.
      ],
      cons: [
        - The distance launched can be unreliable
        - The optimal parts that we need are not readily available
        - The design may launch out of the field
      ],
    )
  ],
  image("./flywheel.svg", width: 70%),
  [
    == Puncher

    A puncher provides linear force to the projectiles using elastic force.

    #pro_con(
      pros: [
        - The design would most likely launch triballs across the field
        - The design is small
        - The design would be able to fit under the bar
      ],
      cons: [
        - Our team does not have experience building punchers
        - The nature of punchers is such that it would be hard on the materials it is
          build with, causing damage
        - It woud take a long time to build and we do not have a lot of time
      ],
    )
  ],
  image("./puncher.svg"),
)
