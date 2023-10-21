#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Build: Intake",
  type: "build",
  start_date: datetime(year: 2023, month: 8, day: 18),
)[

  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    [
      Once the design for the intake was done we could start building it. We completed
      the following steps on the first day of building the intake:
      1. We gathered all materials specified by the BOM.
      2. We cut the aluminum angles down to size. We cut 4 10 long ones, and 2 15 long
        ones.
      3. We attached the bearings to each of the angles, 1 on each end.
      5. We mounted the angles to the drivetrain with the pillow bearings.
      6. We then assembled the axles and spacing. We took the two axles, and inserted
        them into the 10 long angles.
      7. We slid the spacers, sprockets, and locking collars onto each axle.
      8. We mounted the motor cap to its axle.
      9. We attached the chain to the inner sprockets to bind the two rollers together.
      10. We got started on the bracing, screwing the standoffs together in order to get
        them to the required length.
      11. We then added collars to the end of the standoffs, and then mounted one collar
        to one of the 15 long angles, and the other collar to the other one.

      #nb_admonition(type: "note")[
        We still need to finish the following things:
        - Mount the motor
        - Add the rubber bands
        - Finish the cross bracing
      ]

    ],
    [
      #image("./day1_iso.jpg")
      #image("./day1_top.jpg")
      #image("./day1_side.jpg")
    ],
  )

]

#create_entry(
  title: "Build: Intake",
  type: "build",
  start_date: datetime(year: 2023, month: 8, day: 19),
)[
  #grid(
    columns: (1fr, 1fr),
    gutter: 10pt,
    [
      The build today was relatively simple. We completed the following steps:
      1. Assembled the other half of cross bracing.
      #nb_admonition(
        type: "note",
      )[
        We originally planned to have a flexible standoff used in order to not have to
        change the height of the second bracing, but this ended up not being
        structurally sound. We mirrored the same bracing we build yesterday, but used
        more spacers for the mounting in order to bring it above the first one.
      ]
      2. We added a ziptie to the crossbracing to hold the two halves together.
      3. We mounted the motor to the motor cap with rubber bands.
      4. We added the rubber bands to the outer sprockets, completing the intake rollers.
      5. We ziptied mesh to the bottom of the intake to act as an intake surface.

      #nb_admonition(
        type: "note",
      )[
        We decided to hold off on full scale testing of the intake subsystem until our
        catapult subsystem is complete. The two systems are too integrated to be able to
        test them separately.
      ]
    ],
    [
      #image("./day2_iso.jpg")
      #image("./day2_top.jpg")
      #image("./day2_front.jpg")
    ],
  )

]
