#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Decide: Drivetrain Sensors",
  type: "decide",
  start_date: datetime(year: 2023, month: 07, day: 28)
)[
We rated each configuration for:
- Ease of use on a scale of 1 to 2
- Accuracy on a scale of 1 to 5
- Compactness on a scale of 1 to 3
We weighted accuracy so high due to how crucial it is that the tracking correctly represent the robot's location throughout the entire match.
#nb_decision_matrix(
    properties: ("Ease of use", "Accuracy", "Compactness"),
    choices : (
      ("GPS", 2, 2, 3),
      ("Three Tracking Wheels", 1, 5, 1),
      ("Two Tracking Wheels and IMU", 1.5, 4.5, 2),
      ("Integrated Motor Encoders", 1, 2, 3),
      )
    )

#nb_admonition(type: "decision")[
We decided on two tracking wheels and an IMU due to just the right balance of accuracy, compactness, and ease of use.
]


#nb_heading([Final Tracking Wheel Design], level: 1)

#grid(
    columns: (50%, 50%),
    rows: (25%, 25%),
    gutter: 0pt,
    image("../assets/tracking-wheels/isometric.png"),
    image("../assets/tracking-wheels/front.png"),
    image("../assets/tracking-wheels/top.png"),
    image("../assets/tracking-wheels/side.png"),
)


#pagebreak()

//TODO: remove item number or make them mean something

#image("/assets/tracking-wheels/tracking-wheel-drawing.png")
]
