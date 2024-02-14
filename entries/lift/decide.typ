#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Decide: Lift",
  type: "decide",
  date: datetime(year: 2024, month: 1, day: 5),
  author: "John Kelley",
  witness: "Violet Ridge",
)

After identifying our options, we compared the options with a decision matrix.
We rated each choice by the following categories:

- Ease of design and fabrication on a scale of 1 to 5.
- Possible height on a scale of 1 to 5. This is the potential height that the
  mechanism could pull the robot up to.
- Reliability and ease of use on a scale of 1 to 5.

#decision-matrix(
  properties: (
    (name: "Ease of Design and Fabrication"),
    (name: "Possible Height"),
    (name: "Reliability and Ease of Use"),
  ),
  ("Pneumatic Lift", 3, 4, 5),
  ("Balance Mechanism", 5, 1, 1),
  ("PTO Lift", 1, 5, 4),
)

#admonition(
  type: "decision",
)[
  We ended up choosing the pneumatic lift for a variety reasons. It gives us the
  right balance of hang tier, along with being relatively easy to build. It can
  potentially pull us higher than a balance mechanism could, but it doesn't
  require the complex intricacies of a PTO mechanism.
]

= CAD Overview

#grid(
  columns: (1fr, 2fr),
  gutter: 20pt,
  [
    == Flywheel

    The flywheel sits at the end of the lift, and acts as our shooting mechanism.
    The design is exactly the same as the one we had statically mounted to our
    robot. It uses a 84:24 gear ratio, with 3" flex wheels. Having the flywheel
    mounted like this provides us with the advantage of being able to shoot over
    blockers with ease, and provides extra weight to push down on the robot with.
  ],
  image("./flywheel-annotated.png"),
)

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  image("./hang-assist-annotated.png", width: 110%),
  [
    == Hang Assist

    The hang assist is a piece of custom cut plastic that hold the robot in place
    once we elevate. It will be laser cut out of acetal. It has a wedge shape on one
    side to let the elevation bar slide up into the held position, very similar to
    our original passive elevation mechanism.
  ],
  [
    == Pistons

    Our lift has two pistons, one on each side of the mechanism. These can be
    extended or retracted to move the lift up and down.

    When the lift is extended, the flywheel can be spun up, and the match loaders
    can shoot without being obstructed by opposing robots.

  ],
  figure(image("./extended.png"), caption: "The lift in it's extended state"),
  figure(image("./retracted.png"), caption: "The lift in it's retracted state"),
  [
    When it comes time to lift the robot into the air, the pistons pull down,
    pulling the robot upwards. We plan to add rubber bands to assist the pull if the
    robot is too heavy for the pistons.

  ],
)

#image("1.svg")
#image("2.svg")
