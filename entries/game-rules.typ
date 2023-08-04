#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Identify Game Rules",
  type: "identify",
  start_date: datetime(year: 2023, month: 4, day: 29),
  [
  #nb_heading(
    [Field Elements #footnote([Images sourced from: #link("https://content.vexrobotics.com/docs/23-24/vrc-overunder/VRC-Manual-2324-1.1-Release.pdf")])],
    level: 1,
  )

  \

  #align(
    center,
    [
    #image(
      "/assets/field-elements/full-field.png",
      width: 75%,
    )
    ],
  )

  #grid(
    columns: (1fr, 1fr),
    gutter: 50pt,
    image("/assets/field-elements/triballs.png"),
    par(
      [
      #nb_heading([Triballs], level: 2)
      - Can be a total of 60 triballs in play
      - 4 alliance triballs
      - 44 match loads
      - 12 begin on the field
      - 7" radius
      - 6.18" height
      ],
    ),
    par(
      [
      #nb_heading([Goal], level: 2)
      - 1 per alliance
      - 47" long
      - 23.08" wide
      - low bar is 5.78" away from tiles
      ],
    ),
    image("/assets/field-elements/goal.png"),
    image("/assets/field-elements/barrier.png"),
    par(
      [
      #nb_heading([Barriers], level: 2)
      - 1 long barrier
      - 2 short barriers
      - long barrier is 94.25" long
      - short barrier is 49.13" long
      - both barriers are 2.88" tall
      ],
    ),
    par(
      [
      #nb_heading([Elevation Bar], level: 2)
      - 1 per alliance
      - consists of a high bar and a low bar
      - both bars are 2.38" in diameter
      - low bar is 21.89" long
      - low bar is 11.63" away from the tiles
      - high bar is 30.23" tall
      ],
    ),
    image("/assets/field-elements/elevation-bar.png"),
    image("/assets/field-elements/load-zone.png"),
    par(
      [
      #nb_heading([Match Load Zones], level: 2)
      - 4 total
      - two per alliance
      - colored bar is 30" long
      - colored bar is 14.96" away from back corner of the field
      ],
    ),
    par(
      [
      #nb_heading([Offensive Zones], level: 2)
      - 1 per alliance
      - does not include match load zones
      - each zone is 3 tiles by 6 tiles large
      ],
    ),
    image("/assets/field-elements/offensive-zones.svg"),
  )

  #nb_heading([Scoring], level: 1)

  - each triball in a goal is worth 5 points
  - triballs in an offensive zone are worth 2 points
  - highest climbing robot is worth 20 points
  - second highest climbing robot is worth 15 points
  - third highest climbing robot is worth 10 points
  - lowest climbing robot is worth 5 points
  - the autonomous bonus is worth 8 points

  #nb_heading([Important Terms], level: 1)

  #nb_heading([Double-Zoned], level: 2)
  - An alliance is double zoned when both of their robots are in the same offensive zone

  #nb_heading([Elevated], level: 2)
  - A robot is considered elevated when the only field element they're touching is the elevation bar (excluding the elevation cap)

  #nb_heading([Important Rules], level: 1)

  #nb_heading([SG1], level: 2)

  - Once robot of each alliance must start in the other team's offensive zone

  #nb_heading([SG2], level: 2)
  - Horizontal expansion is limited to 36"
  - There is no vertical limit

  #nb_heading([SG6], level: 2)
  - triballs can be loaded into the field in the match load zone
  - triballs can be loaded directly onto the robot if the robot is touching the match load zone

  #nb_heading([SG7], level: 2)
  - possession is limited to 1 triball

  #nb_heading([SG8], level: 2)
  - A robot cannot enter an alliance's goal unless they are double zoned

  #nb_heading([SC7], level: 2)
  - Alliances get an autonomous win point if they do the following tasks in the autonomous period:
  - Remove triball from alliance match load zone
  - Score triball in alliance goal
  - End autonomous period with robot touching elevation bar

  #nb_heading([R12], level: 2)
  - The motors on a robot are limited to a total of 88W. The robot can have any combination of 11W and 5.5W motors. This means that robots can now have up to 16 motors.
  ],
)
