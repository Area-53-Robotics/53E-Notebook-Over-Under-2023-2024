#import "/template/template.typ": *
#show:  create_entry.with(
  title: "Decide: Autonomous Routes",
  type: "decide",
  start_date: datetime(year: 2023, month: 11, day: 28), // TODO: fix date
)

= Match Autons


#grid(
  columns: (1fr,1fr),
  gutter: 20pt,
  [
  == Offensive
  #lorem(50),
  ],
  image("./offensive.png"),
  image("./defensive.png"),
  [
  == Defensive
  #lorem(50)
  ],
)

= Skills Auton

#image("./skills.png")
