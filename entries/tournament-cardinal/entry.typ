#import "/packages.typ": notebookinator, diagraph
#import notebookinator: *
#import themes.radial.components: *
#import themes.radial.colors: *
#import "/utils.typ": tournament-from-csv

#import diagraph: *

#show: create-body-entry.with(
  title: "Tournament: Cardinal Classic",
  type: "test",
  date: datetime(year: 2024, month: 2, day: 10),
  //author: "Meghana Noojipady",
  //witness: "Felix Hass",
)

= Qualifications

#let qual-data = tournament-from-csv(
  read("./RE-VRC-23-1735-Default Division-Results-2024-02-13.csv"),
  team-name: "53E",
  section: "qualifications",
)

#(qual-data.at(3).awp = true)
#(qual-data.at(4).awp = true)

#tournament(..qual-data)

= Eliminations

We were ranked 23rd in alliance selection, so we didn't have very many options
while making alliance selection. We wanted to prioritize getting picked by
another team over making a pick ourselves in an attempt to move up as a seed.

#raw-render[```dot
  digraph {
    rankdir=LR;
    start->"We get picked by 1727Y"
    "We get picked by 1727Y"->"We pick 53C" [label = "no"]
    "We get picked by 1727Y"->"end" [label = "yes"]
    "We pick 53C" ->"end"[label = "yes"]

    start[shape=Mdiamond]
    end[shape=Msquare]
  }
```]

Unfortunately 1727Y got picked by 11555A, and we got picked by 21078A before we
could pick 53C.

#let elims-data = tournament-from-csv(
  read("./RE-VRC-23-1735-Default Division-Results-2024-02-13.csv"),
  team-name: "53E",
  section: "eliminations",
)

#tournament(..elims-data)

#colbreak()

= Reflection

== Overall Performance

#grid(
  columns: (1fr, 1fr),
  pie-chart(
    (value: 4, color: green, name: "wins"),
    (value: 3, color: red, name: "losses"),
  ),
  [
    Our win loss ratio was not where we want it to be, but we were able to score the
    AWP twice, and almost a third time during Q83. Each time we got AWP we massively
    advanced in the rankings, but the loss in our final qualifications match left us
    without very many options during eliminations.
  ],
)

== Robot Performance

After this tournament we'll have some time before the state tournament to
address issues. Therefore it's worth it to do an overview of our robot's
subsystem's performance to see where we need improvement.

=== Wings

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt, //
  [
    Overall the wings were probably the best performing part of our robot, and work
    great, even with the changes in strategy we've made. There are a few minor
    issues, but these are easily fixable.
  ],
  pro-con(pros: [
    - Work reliably
    - Consistently push triballs into the goal
  ], cons: [
    - Sometimes don't fully retract if rubber bands break
  ]),
)

=== Intake

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt, //
  [
    The intake is the biggest problem point on our robot currently. We haven't
    changed the design in a very long time, and the optimal design has changed a
    lot. Not only that, but the intake has some severe structural problems that will
    only get worse if not addressed.
  ],
  pro-con(pros: [
    - Consistently grabs the triballs
  ], cons: [
    - Rubber bands easily break
    - C-channel is bending, putting stress on the axle
    - The axle is low strength, making it very easy to bend
  ]),
)

#colbreak()

=== Flywheel

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt, //
  [
    The flywheel is another problem point on our robot, but we're not sure if we
    will have enough time to fix it before the state competition. Having a shooting
    mechanism is becoming less and less important during match play, but its still
    very useful during skills.
  ],
  pro-con(pros: [
    - Can be loaded very quickly
    - Elevation makes it hard to block
  ], cons: [
    - Extremely inconsistent spread
    - Bad mounting to the lift gives it more friction than it should
  ]),
)

=== Lift

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt, //
  [
    The lift has a few problems, but its performance is good enough that we probably
    won't address many issues with it.
  ],
  pro-con(pros: [
    - Is typically able to elevate in under 5 seconds
  ], cons: [
    - Only lifts us to A tier
    - Has trouble lifting without rubber bands
    - Has trouble actuating multiple times in a match
  ]),
)

== Strategy Breakdown

The strategy we used at this this tournament was very different from the
strategy we used at Gateway. We've become more comfortable with the field
starvation strategies, and have become better at knowing when to apply them and
when not to. Here is the decision making process we used to choose our strategy:

#raw-render[```dot
  digraph {
    rankdir=LR;
    start->"Do our opponents have angled wings?"
    "Do our opponents have angled wings?" ->"Field Starvation"[label = "yes"]
    "Do our opponents have angled wings?" ->"Shooting"[label = "no"]

    start[shape=Mdiamond]
  }
```]

The main deciding factor is how fast they can return triballs to our side of the
field, and the fastest way we've seen to do that is angled wings.

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  pie-chart(
    (value: 5, color: red, name: "Field Starvation"),
    (value: 2, color: orange, name: "Shooting"),
  ), //
  [
    Overall we ran field starvation strategies more often than we did shooting,
    mainly because even if we were facing an alliance that couldn't relocate
    triballs easily, they had some kind of shooting mechanism we could capitalize
    off of. Overall we found it more effective to score triballs introduced by other
    teams rather than introduce them ourselves.

  ],
)
