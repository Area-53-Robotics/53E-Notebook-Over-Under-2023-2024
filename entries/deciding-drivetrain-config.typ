#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Decide: Drivetrain Configuration",
  type: "decide",
  start_date: datetime(year: 2023, month: 6, day: 19),
  end_date: datetime(year: 2023, month: 7, day: 14),
  [
  We then rated each configuration for it's speed, strength, and maneuverability on a scale of 0 to 5.

  #nb_decision_matrix(
    properties: ("Speed", "Strength", "Maneuverability"),
    choices: (
      ("6:3, 4\" wheels, green cartridges", 5, 2, 3),
      ("3:5, 3.25\" wheels, blue cartridges", 3, 4, 2),
      ("3:5, 4\" wheels, blue cartridges", 0, 0, 0),
      ("4:7, 4\" wheels, blue cartridges", 3.5, 4, 3),
    ),
  )

  #nb_admonition(
    type: "note",
    [
    The 3:5, 4", blue cartridge config was not rated due to it's infeasibility.
    ],
  )

  #nb_admonition(
    type: "decision",
    [
    We settled on a drivetrain with a 4:7 gear ratio, 4" wheels, and blue cartridges, leaving us with a final RPM of 360, and a final speed of 6.7 feet/second.
    ],
  )

  #nb_heading([Final Drivetrain Design], level: 1)

  #align(
    center,
    [
    #image(
      "/assets/drivetrain/drivetrain-cad-side.png",
      width: 45%,
    )
    #image(
      "/assets/drivetrain/drivetrain-cad-top.png",
      width: 45%,
    )
    ],
  )

  #pagebreak()

  //TODO: remove item number, or make the item numbers mean something
  #align(
    center,
    [
    #image("/assets/drivetrain/part-drawings/1.png") 
    #image("/assets/drivetrain/part-drawings/2.png")
    #image("/assets/drivetrain/part-drawings/3.png")

    ],
  )

  ],
)
