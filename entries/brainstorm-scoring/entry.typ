#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Brainstorm: Scoring Triballs",
  type: "brainstorm",
  start_date: datetime(year: 2023, month: 9, day: 2),
  end_date: datetime(year: 2023, month: 9, day: 4),
)[

// TODO: add images
// TODO: fill out pros and cons

#grid(
columns: (1fr, 1fr),
gutter: 20pt,

[
  #nb_heading([Extendable Arm])
  An extendable arm to capture triballs from the loading zone, and pushing triballs in with a lexan skirt on the robot.
  #nb_pro_con(
    pros: [
    ],
    cons: [

    ]
  )

],
[],

[
  #nb_heading([Folding Skirts])
  Skirts that can fold outwards, and shovel triballs in. In addition we can add rounded sloped corners on the ends to lift the front of the bot upwards in order to help us get over the barrier.
  #nb_pro_con(
    pros: [

    ],
    cons: [

    ]
  )
],
[],

[
  #nb_heading([Extendable Net])
  An extendable net to go over the triball and pull it inwards. 

  #nb_pro_con(
    pros: [
      - Looks cool
      - Gladiator style points
    ],
    cons: [
      - Very difficult to build
      - Very difficult to reload
    ]
  )
],
[],

)



]