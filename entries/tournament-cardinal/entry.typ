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

#tournament(..qual-data)

= Eliminations

#let elims-data = tournament-from-csv(
  read("./RE-VRC-23-1735-Default Division-Results-2024-02-13.csv"),
  team-name: "53E",
  section: "eliminations",
)

#tournament(..elims-data)
