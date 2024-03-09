#import "/packages.typ": notebookinator, diagraph
#import notebookinator: *
#import themes.radial.components: *
#import "/utils.typ": tournament-from-csv

#import diagraph: *

#show: create-body-entry.with(
  title: "Tournament: State Championship",
  type: "test",
  date: datetime(year: 2024, month: 1, day: 27),
  author: "Meghana Noojipady",
  witness: "Felix Hass",
)

= Qualifications

#let qual-data = tournament-from-csv(
  read("./RE-VRC-23-2762-HS States-Results-2024-03-08.csv"),
  team-name: "53E",
  section: "qualifications",
)

#(qual-data.at(0).awp = true)

#tournament(..qual-data)

#colbreak()

= Alliance Selection

We ended up in 24th place, leaving us in the unfortunate situation of needing to
be picked by a team higher up in the rankings. If a team picked us we would be
forced to accept, so there wasn't much decision making to do. Here's the list of
teams we talked to, in the order that they ranked by.

+ 9080C
+ 9080H
+ 929S
+ 929T

In the end, 9080H picked us because they weren't picked by their first pick.

= Eliminations

#let elims-data = tournament-from-csv(
  read("./RE-VRC-23-2762-HS States-Results-2024-03-08.csv"),
  team-name: "53E",
  section: "eliminations",
)

#tournament(..elims-data)

We ended up being eliminated in our first round 16 match, by a single point.

= Reflection
#grid(
  columns: (1fr, 1fr),
  align(center, pie-chart(
    (value: 4, color: green, name: "wins"),
    (value: 5, color: red, name: "losses"),
  )),
  [
    Overall, our match performance wasn't great. We weren't able to maintain our
    momentum, and were only able to score the AWP once, leading us to be placed
    lower than we would have liked.

    Fortunately, we were able to win the Design Award, qualifying us for the World
    Championship!

    Not only that, but two other teams in our organization qualified as well, 53C
    and 53F.
  ],
)
