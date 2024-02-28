#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Management: Road to States",
  type: "management",
  date: datetime(year: 2024, month: 2, day: 11), 
)

#gantt-chart(
  start: datetime(year: 2024, month: 2, day: 10),
  end: datetime(year: 2024, month: 3, day: 2),
  date-interval: 7,
  tasks: (
    ("Intake Rebuild", (0,1)),
    ("Program Robot", (1,4)),
    ("Driver Practice", (1,4)),
  ),
  goals: (
    ("State Championship", 4),
  )
)
