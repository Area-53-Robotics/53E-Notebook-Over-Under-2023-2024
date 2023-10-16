#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
    title: "Brainstorm Solutions: Wedges",
    type: "brainstorm",
    start_date: datetime(year: 2023, month: 8, day: 31),
    end_date: datetime(year: 2023, month: 9, day: 3) 
)[

#grid(
    columns: (1fr, 1fr), 
    gutter: 20pt, 

    [
        #nb_heading([Wedges], level: 1) 
        #nb_pro_con( 
        pros: [ 
         - It can double as a skirt. 
         - It is the stereotypical wedge. 
         - The slant gives our robot mechanical advantage while pushing other robots.
         - The shape is simple to design. 
        ],
        cons: [
         - It is hard to mount because there are no flat surfaces. 
         - The design will possibly require reinforcement of the robot. 
         - It is unoriginal. 
        ]
        )

    ],
    image("./wedges.svg"),
    [
        #nb_heading([Snow Plow], level: 1)
        #nb_pro_con(
        pros: [
        - It is slanted at the bottom to give mechanical advantage.
        - The back is flat and will be easier to mount. 
        - It could possibly double as a skirt. 
        ], 
        cons: [
        -  The shape is odd and would be hard to create. 
        - The protrusion at the top may limit the effectiveness. 
        - Not as slanted as the wedges.
        - It would not allow the robot to go over the barrier. 
        ]
    )
    ],
    image("./plow.svg"),
    [
        #nb_heading([Arms], level: 1)
        #nb_pro_con(
        pros: [
        - The back is flat and would be easy to mount. 
        - If mounted really close to the floor it would be able to slide easily under a skirt. 
        - It can help to push other robots. 
        ], 
        cons: [
        - Not slanted, forfeiting mechanical advantage
        - Would not allow the robot to go over the barrier. 
    ]
    )
    ],
    image("./forklift.svg")

)    
]
