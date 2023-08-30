#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
title: "Build: Tracking Wheels",
type: "build",
start_date: datetime(year: 2023, month: 8, day: 12)
)[


#grid(
columns: (1fr, 1fr),
gutter: 20pt,
[
We followed the following steps to construct the tracking wheels:
1. We gathered all of the materials for the tracking wheels twice, once for each tracking wheel.
2. We attached the standoff retainer to the aluminum plate with a single screw and lock nut.
3. We attached the plate and 1 bearing to the 3-Channel with screws and lock nuts.
4. We attached the optical shaft encoder to the other side of the 3-channel with screws and lock nuts.
5. We took the axle and pressed it through the hole in the shaft encoder so the tip stuck out the other end.
6. We placed the 1/8" spacer on the end of the axle.
7. We placed the 2.75" omni wheel (making sure to include the inserts) on the axle.
8. We placed the 1/4" spacer and shaft collar on the axle, and then locked the collar.
],
[
#image("./top.jpg", width: 75%)
#image("./iso.jpg", width: 75%)
]
)



#nb_admonition(type: "build")[
Our tracking wheels are finally complete.
]

#image("./complete.jpg", width: 75%)

]

