#import "/packages.typ": notebookinator, diagraph
#import notebookinator: *
#import themes.radial.components: *
#import "/utils.typ": tournament-from-csv

#import diagraph: *

#show: create-body-entry.with(
  title: "Tournament: Gateway to the West",
  type: "test",
  date: datetime(year: 2024, month: 2, day: 3),
  author: "Meghana Noojipady",
  witness: "Felix Hass",
)

= Qualifications

#let qual-data = tournament-from-csv(
  read("./RE-VRC-23-1495-Gateway to the West HS-Results-2024-02-13.csv"),
  team-name: "53E",
  section: "qualifications",
)

#(qual-data.at(4).auton = true)
#(qual-data.at(4).awp = true)

#tournament(..qual-data)

= Reflection

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  pie-chart(
    (value: 3, color: green, name: "wins"),
    (value: 7, color: red, name: "losses"),
  ),
  [
    Despite the fact that we didn't make it to eliminations this tournament was very
    successful for us. We got to see first hand how high level strategy works, and
    were introduced to techniques like field starvation.

    We also finally were paired with alliance partners who could score the other
    half of the AWP, and we were able to gauge its effectiveness.
  ],
)

== Strategic Performance

The first thing we noticed was that many teams were running a field starvation
strategy. Teams were playing for control, rather than trying to score as many
points as possible by shooting triballs.

We had seen other teams use this strategy at the Kalahari classic, but we had
never seen it in person.

This strategy was completely different from what we'd encountered in the past,
it basically completely changed the game. Our shooting mechanism become mostly
useless, and we found that in the matches we did shoot, the opposing alliance
was able to use our triballs more effectively than we were.

// Notes:
// Q1
// shooting strats
// switched to bowling
// Q28
// DCed
// Q48
// heavy defence played on us
// got a hang off
// Q67
// shooting
// we lost, badly
// Q80
// field starvation
// Q100
// Shooting/Field starvation hybrid
// Q116
// I'm not even sure what to call this
// I guess this was shooting?
// Q128
// Field starvation
// Q141

== Autonomous Performance

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt, //
  pie-chart(
    (value: 1, color: blue, name: "AWP"),
    (value: 9, color: red, name: "No AWP"),
  ), //
  [
    We scored the autonomous win point for the first time during this tournament,
    but only once.

    Despite this, the AWP gave us a large advantage during qualifications, placing
    us above our other sister teams who didn't have it.
  ],
)
