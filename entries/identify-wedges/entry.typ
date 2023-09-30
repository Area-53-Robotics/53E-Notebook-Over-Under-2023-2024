#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
    title: "Identify: Wedges",
    type: "identify",
    start_date: datetime(year: 2023, month: 8, day: 26),
    end_date: datetime(year: 2023, month: 9, day: 3) 
)[
 #figure(
  image("modelone.png", width: 80%)
)
\ \ \ 
#nb_heading([Design Constraints], level: 1)
- The design is constrained by the following: No actuators, has to use vex materials, and has to fit on the robot. 
\ 
#nb_heading([Design Goals], level: 1)
- Needs to be able to push another larger robot 2 feet while driving into it.
]