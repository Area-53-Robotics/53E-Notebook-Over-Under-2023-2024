#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
    title: "Decide: Wedges",
    type: "decide",
    start_date: datetime(year: 2023, month: 9 , day: 8)
)[

We rated the choices on a scale from 1 to 5: 
- Ease Of Build
- Widespread Use
- Use Of Actuators

#nb_decision_matrix(properties: ("Ease Of Build", "Widespread Use", "Use Of Actuators"), choices: (
    ("Wedges", 3, 4, 5),
    ("Plow", 2, 2, 5),
    ("Arms", 1, 1, 0),
)
)
#nb_admonition(type: "decision")[
    The final decision is to use the wedges. Ultimately, they were the easiest and most efficient to use. The wedges are also passive, which means they don't require motors or pistons to be put into use. 
]
]


