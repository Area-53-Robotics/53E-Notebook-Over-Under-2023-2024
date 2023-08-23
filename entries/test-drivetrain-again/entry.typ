#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
title: "Test: Drivetrain Power Usage",
type: "test",
start_date: datetime(year: 2023, month: 8, day: 11)
)[

We retested the power draw of our drivetrain to check if our friction fixes were successful. The testings steps are the same as found in the first drivetrain, omitting the temperature measurement.

#grid(
  columns: (1fr, 2fr),
  gutter: 20pt,
  [
  The left side motors are using around half the power they were using before, with the third motor going down from approximately 2W down to 1W. The other two motors are consuming almost no power whatsoever. 

  ], 
  image("./left.png"),

  [

  The right side is also within the acceptable 1W. The first motor consumes the most power, using around 0.8W. The third motor consumes approximately 0.35W of power, and the second motor consumes almost none.

  ], 
  image("./right.png"),

)

Overall these results are very promising, and show that our drivetrain is performing within expectations. It consumes very little power, and therefore has very little friction.
]

