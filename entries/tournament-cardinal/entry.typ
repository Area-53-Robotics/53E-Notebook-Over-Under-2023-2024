#import "/packages.typ": notebookinator, diagraph
#import notebookinator: *
#import themes.radial.components: *
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
    #lorem(20)
  ],
  pro-con(pros: [], cons: []),
)

=== Intake

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt, //
  [
    #lorem(20)
  ],
  pro-con(pros: [], cons: []),
)

=== Flywheel

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt, //
  [
    #lorem(20)
  ],
  pro-con(pros: [], cons: []),
)
