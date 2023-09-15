#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
title: "Decide: Autonomous Movement",
type: "decide",
start_date: datetime(year: 2023, month: 8, day: 29)
)[

We rated all of our choices by the following criteria:
- Simplicity on a scale of 0 to 3. This is how simple the algorithm is to implement.
- Accuracy on a scale of 0 to 3. This is how closely the algorithm can follow the intended path.
- Robustness on a scale of 0 to 3. This is the amount of use cases that the algorithm covers.

#nb_decision_matrix(
  properties: ("Simplicity","Accuracy", "Robustness"),
  choices: (
    ("Bang Bang", 3, 1, 1),
    ("PID", 2, 3, 3),
    ("Pure Pursuit", 1, 3, 2.5),
  )
)

#nb_admonition(type: "decision")[
We decided to use the PID controller for most of our movements, however we might still use Pure Pursuit for a few of them. This is mainly because they cover different use cases. Pure Pursuit would primarily be used for long movements that span the field, with a long complex path. PID is much better for shorter movements. Its likely that we'll only ever need PID, but we'll keep Pure Pursuit in mind. 
]

#nb_heading([Implementation], level: 1)

LemLib provides a movement implementation using PID which already integrates with the Odometry it provides, so we'll use that.


]
