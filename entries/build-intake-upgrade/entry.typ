#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Build: Intake Upgrade",
  type: "build",
  start_date: datetime(year: 2023, month: 9, day: 30),
)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    [
      After finishing the catapult we realized that the second intake roller
      interfered with the catapult arm. We decided to remove one of rollers to let the
      catapult fire uninhibited.

      1. We unscrewed the bracing from the top of the intake.
      2. We unscrewed the rear 2 pillow bearings.
      3. We took the rear roller off of the drivetrain.
      4. We build stops our of standoffs to stop the intake from traveling out too far.

      #nb_admonition(
        type: "warning",
      )[
        With the removal of the cross bracing the two pieces of half cut can move
        independently. The only thing keeping them in line are the stops. This design is
        undesirable, and can lead to excess friction.
      ]
    ],
    figure(image("./top.jpg"), caption: "Finished intake"),
  )

]
