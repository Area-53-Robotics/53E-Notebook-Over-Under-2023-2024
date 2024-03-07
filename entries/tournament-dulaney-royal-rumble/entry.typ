#import "/packages.typ": notebookinator, codetastic, diagraph
#import notebookinator: *
#import codetastic: qrcode
#import themes.radial.components: *

#import "@preview/plotst:0.2.0": *
#import "@preview/diagraph:0.1.0": *
#import "@preview/codetastic:0.2.2": qrcode

#show: create-body-entry.with(
  title: "Tournament: Dulaney Royal Rumble",
  type: "test",
  date: datetime(year: 2023, month: 11, day: 4),
  author: "Joy Oladimejij",
  witness: "Violet Ridge",
)

#heading[Qualifications]

#tournament(
  (
    match: "Q5",
    red-alliance: (teams: ("18391B", "18391A"), score: 44),
    blue-alliance: (teams: ("53E", "929S"), score: 66),
    won: true,
    auton: false,
    awp: false,
    notes: [
      We played on the defensive side of the field, with our alliance partner 929S.
      They had a good shooting mech so we were able to just score. Our wedges worked
      great and we were able to score a lot of triballs.

      We went for a hang, but we ran out of time.
    ],
  ),
  (
    match: "Q11",
    red-alliance: (teams: ("21146S", "5588B"), score: 55),
    blue-alliance: (teams: ("53E", "53A"), score: 72),
    won: true,
    auton: false,
    awp: false,
    notes: [
      We played the shooter position while 53A played the scoring position.
      Unfortunately, our catapult jammed right away, stopping us from actually
      delivering triballs to them. We tried to pivot to the offensive side, but we had
      a triball loaded inside our catapult, meaning we could not possess a second
      triball. Fortunately 53A was able to push enough triballs into the goal to allow
      us to win the match.
    ],
  ),
  (
    match: "Q18",
    red-alliance: (teams: ("53E", "9290B"), score: 43),
    blue-alliance: (teams: ("99009A", "929T"), score: 89),
    won: false,
    auton: false,
    awp: false,
    notes: [
      We played the offensive side, while 9290B played the defensive side. 9290B was
      able to give us a lot of triballs, but our driver was not able to gather them
      quickly enough. In addition, the motor on our intake broke off our bot. This
      stopped us from picking up triballs, but it also meant that we couldn't elevate.
    ],
  ),
  (
    match: "Q29",
    red-alliance: (teams: ("1727R", "53E"), score: 50),
    blue-alliance: (teams: ("5588H", "1893X"), score: 36),
    won: true,
    auton: false,
    awp: false,
    notes: [
      We played on the offensive side of the field, while 1727R played defensive.
      Unfortunately, 1727R's catapult wasn't functional, meaning they couldn't give us
      triballs. They joined us on the offensive side of the field, and we both pushed
      triballs into the goal.

    ],
  ),
  (
    match: "Q41",
    red-alliance: (teams: ("7135Z", "98719A"), score: 70),
    blue-alliance: (teams: ("53E", "53B"), score: 60),
    won: false,
    auton: false,
    awp: false,
    notes: [
      We played on the offensive side, allowing 53B to throw us triballs with their
      catapult. Their catapult wasn't strong enough to shoot triballs across the
      field, so we didn't have enough triballs to work with. Our driver did a good job
      pushing triballs into the goal but we couldn't get enough triballs into the goal
      to outpace our opponents.
    ],
  ),
  (
    match: "Q51",
    red-alliance: (teams: ("929N", "1893C"), score: 143),
    blue-alliance: (teams: ("53E", "1727A"), score: 40),
    won: false,
    auton: false,
    awp: false,
    notes: [
      We played on the offensive side, receiving triballs from 1727A's catapult.
      Unfortunately 1893C's robot has a blocker, so they spent the entire match
      stopping 1727A from delivering triballs to us.
    ],
  ),
)

#heading[Eliminations]

#heading(level: 2)[Alliance Selection]

We ended up in 21st place, leaving us with little options. Since there were 16
seeds it was likely that we would get to pick, but there wouldn't be many very
choices. Our first pick was 1727Y who we've allied with in the past. It was an
incredibly risky pick though because they were in 27th. This means that if they
got picked before us they would have to accept, leaving us without a pick.

We also negotiated with 1727A and 1893C who were in 18th and 19th respectively.

#raw-render[```dot
  digraph {
    rankdir=LR;
    start->"1727A picks us"
    "1727A picks us"->"1893C picks us" [label = "no"]
    "1727A picks us"->"end" [label = "yes"]
    "1893C picks us"->"We pick 1727Y" [label = "no"]
    "1893C picks us"->"end" [label = "yes"]
    "We pick 1727Y"->end [label = "no"]

    start[shape=Mdiamond]
    end[shape=Msquare]
  }
```]

In the end, 1727Y got picked by 929T and 1727A and 1893C picked each other,
leaving us without many options. We ended up getting picked by 98719A, who was
in 20th, directly above us.

#tournament(
  (
    match: "R16",
    red-alliance: (teams: ("53C", "53F"), score: 81),
    blue-alliance: (teams: ("53E", "98719A"), score: 46),
    won: false,
    auton: false,
    awp: false,
    notes: [
      We played on the offensive side of the field, receiving triballs from 98719A's
      puncher. This was going well until we suffered a field error. The match had to
      be replayed. When this happened 53F learned about our strategy and stopped
      98719A from shooting.
    ],
  ),
)

#heading[Reflection]

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  pie-chart(
    (value: 5, color: red, name: "Offensive"),
    (value: 1, color: blue, name: "Defensive"),
  ),
  [
    We only ever played once match on the defensive side of the field. This meant
    that we only got to use our catapult once, and when we did it jammed. This meant
    we only ever really got to use our catapult during skills.
  ],
  [
    Since most of our matches were played on the offensive side we heavily relied on
    our alliance partner's competence to win matches. Of the 4 losses we had, 3 of
    them were due to our alliance partner not being able to send us enough triballs,
    either due to their robot malfunctioning, or having defense played on them.
  ],
  pie-chart(
    (value: 3, color: green, name: "Wins"),
    (value: 4, color: red, name: "Losses"),
  ),
)

#admonition(type: "note")[
  #lorem(20)
]

#heading[Robot Performance]

#heading(level: 2)[Catapult]

Our catapult remained pretty unused during the competition. We played a single
match on the defensive side and during that match it jammed. It performed pretty
well during skills, and got us to in 6th place for skills.

#pro-con(pros: [
  - Really fast cycle speed
], cons: [
  - Still couldn't consistently shoot across the barrier
  - Ratchet didn't function correctly
])

#heading(level: 2)[Elevation Mechanism]

The mechanism was overall more effective than we thought it would be, did not
score us a single elevation. The one time we got high enough off the ground to
count as elevated, the motor on our intake detached, meaning we were still
touching the ground.

#pro-con(pros: [
  - Completely passive
], cons: [
  - Didn't get us high enough off the ground
  - Didn't consistently count as an elevation
])

#heading(level: 2)[Wings]

#pro-con(
  pros: [
    - Was able to consistently push several triballs into the goal at a time
  ],
  cons: [
    - Slight structural defect where the piston is mounted.
  ],
)

#heading(level: 2)[Intake]

The intake was one of the most used subsystems during this entire tournament. It
was incredibly useful when the field was not covered in triballs, allowing us to
move individual ones without the need for wings.

#pro-con(
  pros: [
    - Was able to consistently take control of triballs and assist with scoring.
    - Sleds protect the sprockets for getting rammed into the goal
  ],
  cons: [
    - Completly unbraced
    - Exposes it's motor for other robot to hit
    - Half cut is bending
  ],
)

#heading(level: 2)[Wedges]

The wedges were a terrifying addition to our robot, allowing us to easily employ
defensive tactics while on the offensive side of the field.

#pro-con(
  pros: [
    - Was able to easily push robots that also had 6 motor drive
  ],
  cons: [
    - The wedges do not fully cover the front of the robot, leaving the tracking
      wheels exposed.
    - Wedges cannot be used to push triballs over the barrier.
  ],
)

#heading(level: 2)[Auton]

Our performance in the autonomous period was frankly embarrassing. All of our
planned routes broke down, and wouldn't correctly move the chassis. This meant
we scored:
- 0 autonomous bonuses
- 0 autonomous win points

After further investigation we discovered that this failure was caused by a
single line of code missing from the linear pid configuration.

```cpp
// forward/backward PID
inline lemlib::ChassisController_t lateralController{
    10,   // kP
    // ERROR: kD should have been right here
    1,    // smallErrorRange
    100,  // smallErrorTimeout
    3,    // largeErrorRange
    500,  // largeErrorTimeout
    5     // slew rate
};
```

#grid(
  columns: (2fr, 1fr),
  gutter: 20pt,
  [
  The reason this was possible in the first place was because LemLib wasn't using
  explicit constructors to define its configuration options, it was having the
  user do manual construction. This meant that instead of throwing an error at
  compile time, it moved all of the other configurations up 1 (`smallErrorRange`
  is now `kD`, `smallErrorTimeout` is now `smallErrorRange`, and so on), and then
  default initialized the bottom value to 0. We brought this issue to the LemLib
  developer's attention, and they fixed it right away. The relevant commit can be
  found in the QR code to the left
  ],
  align(
    center,
    qrcode(
      size: 3pt,
      "https://github.com/LemLib/LemLib/commit/81319e7c39e389932762f7eae5a9a000233d98b9",
    ),
  ),
)
