#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *
#import "/utils.typ": plot-from-csv

#show: create-body-entry.with(
  title: "Test: Intake Rebuild",
  type: "test",
  date: datetime(year: 2024, month: 2, day: 24),
)

#let data = plot-from-csv(read("./Intake-data-2024-02-24_17_27_55.3850.csv"))
#plot(..data)

#let data = plot-from-csv(read("./Intake-data-2024-02-24_17_51_02.8800.csv"))
#plot(..data)
