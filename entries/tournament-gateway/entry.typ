#import "/packages.typ": notebookinator, diagraph
#import notebookinator: *
#import themes.radial.components: *
#import "/utils.typ": tournament-from-csv

#import diagraph: *

#show: create-body-entry.with(
  title: "Tournament: Gateway to the West",
  type: "test",
  date: datetime(year: 2023, month: 11, day: 28), // TODO: fix date
  //author: "Meghana Noojipady",
  //witness: "Felix Hass",
)

= Qualifications

#let qual-data = tournament-from-csv(
  read("./RE-VRC-23-1495-Gateway to the West HS-Results-2024-02-13.csv"),
  team-name: "53E",
  section: "qualifications",
)

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
strategy.

== Autonomous Performance
