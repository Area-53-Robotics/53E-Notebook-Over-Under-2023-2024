#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Brainstorm: Autonomous Movement",
  type: "brainstorm",
  date: datetime(year: 2023, month: 9, day: 11),
  author: "Felix Hass",
  witness: "Violet Ridge",
)

In order to move the robot we need some kind of control loop. This is a process
that moves a system to a target. In this case our system is the robot, and our
target is the coordinate on the field that we are trying to move to. There are
two different types of control loops:

- Closed loop control
- Open loop control

Closed loop control checks the system state each time the loop runs. This means
that the system correct for outside interference.

Open loop control does not take the current system state into consideration. It
calculates the required movement before starting, and then simply follows those
instructions. This means that it cannot correct for outside interference.

We stated in our goals that we wanted the robot to be able to correct for errors
in past movements, so open loop controllers are not an option.

There are a variety of closed loop controllers that are commonly used:

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    == Bang Bang Controller

    This controller only has three states:
    - On
    - Reversed
    - Off

    If the robot is facing the target, the controller outputs maximum power. If the
    robot is facing away from the target (it overshot), the controller outputs
    maximum reverse power. If the system is within acceptable error, the controller
    outputs off.

    #pro-con(pros: [
      - Very simple to implement
    ], cons: [
      - Very imprecise
    ])

  ],
  image("./bang-bang.svg"),
  [
    == PID Controller

    This controller is considerably more complex than the bang bang controller. It
    accounts for the fact that real systems cannot stop instantaneously, and slows
    down as it approaches the target. Its output is calculated by adding together
    it's 3 terms, P, I, and D.

    #v(500pt)

    #pro-con(pros: [
      - Smooth, precise movement
    ], cons: [
      - Harder to implement
      - Doesn't work well with long movements.
    ])

  ],
  image("./pid.svg"),
  [
    == Pure Pursuit

    Pure pursuit is a complex algorithm that follows long, pre generated paths. This
    algorithm works by drawing an imaginary circle around the robot, and having it
    move toward the intersection between that circle and the path.

    #pro-con(pros: [
      - Smooth, precise movement
      - Performs very well with long paths.
    ], cons: [
      - Extremely difficult to implement
      - Doesn't work well with short movements
    ])
  ],
  image("./pure-pursuit.svg"),
)
