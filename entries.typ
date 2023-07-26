#import "/template/entries.typ": *

// TODO: split this into multiple files

#create_entry(
  title: "Pre Reveal Thoughts",
  type: "identify",
  start_date: datetime(year: 2023, month: 4, day: 26),
  end_date: datetime(year: 2023, month: 4, day: 26),
  [

    #nb_heading([Reflection on Last Season], level: 1)
    
    
    53E grew greatly as a team last season on both the building side and the programming side. We struggled a lot with getting a functional bot together, but in the end our bot was able to perform all of the tasks required for the Spin Up season. This difficulty was due to our inexperience and lack of planning. We did not plan our designs before building, we simply starting putting parts together. We did use CAD to a certain extent, but not to the point where we had a 1 to 1 mirror of our bot digitally. We would often be trying to get our bot functional even during tournaments. This meant we were constantly behind, and meant that our bot was not as tuned /* refined? fine tuned? efficient? */ as it could have been, and also meant that we did not have enough time for driver practice and autonomous testing.

    53E grew greatly as a team during the last season on both the building side and the programming side. We struggled to build a robot that could complete all of the tasks in the Spin Up season. This was mainly due to overall inexperience and lack of planning. While we did make an attempt to use CAD, we never really ended up with a 1 to 1 mirror of the robot digitally. More often than not, we would simply put parts together and seeing what would work, rather than planning it out beforehand. This lead to us being very behind, often building on our robot at tournaments. Despite these challenges we eventually built a fully functional robot and even made it to the state championship.
    
    Our programming also had mixed successes. One of our big achievements was working collaboratively. We were able to have two programmers working together on the same team working on the code at the same time. As far as we are aware, this is the first time in the club's history that this has worked. We did this using git and GitHub, which let us easily sync code across both programmer's computers. However we did not meet our major goal of implementing odometry in order to track our robot's position on the field during the autonomous period. Complex algorithms like odometry require a lot of testing in order to be effective, and we chose to prioritize getting a functioning robot over implementing it.

    // TODO: add footnotes for glossary (git, GitHub, CAD)
    
    #nb_heading([Goals], level: 1)

    #nb_heading([Team Management], level: 2)
    - Create and adhere to a schedule of when planning, building, programming, and testing should occur
    - Create a more organized team structure
    
    #nb_heading([Building], level: 2)
    - Create a more structured process for planning and testing work
    - Design everything system before building, using CAD software
    - Undergo more rigorous testing before tournaments
     
    #nb_heading([Programming], level: 2)
    
    - Implement odometry
    - Program an autonomous routine that can cross the field with minimal error buildup.
    
    Overall we are much better prepared for this season than we were the last. Our team is much more capable, not just in the realm of design and building, but also in our ability to write powerful and reliable software.

  ]
)

#create_entry(
  title: "Post Reveal Thoughts",
  type: "brainstorm",
  start_date: datetime(year: 2023, month: 4, day: 27),
  end_date: datetime(year: 2023, month: 4, day: 27),
  [

  After the game reveal each member of the team wrote down their thoughts on what the coming season will look like, and ideas for our robot. \ 
  \
  #nb_admonition(type: "note", [
    These were recorded before the rules were released, so they are made without key information, like expansion limits, or how the autonomous win point will be scored.
  ])

  #nb_heading([Felix], level: 1)
  
  
  #nb_heading([Scoring Mechanisms], level: 2)
  My first thought for a mechanism to move the triballs is something similar to the bots we see for FRC's Charged Up. A long arm with flex wheels that spin to grab the triballs. The climbing mechanism is much more difficult. The real question is whether we use the same mechanism as the triball collector for this, and whether that's feasible to build. The hardest part to me seems like getting a consistent hold on the PVC pipe. It is very inconvenient that  the pole is vertical, which will make it very hard to maintain a grip. 
  
  #nb_heading([Drivetrain], level: 2)
  Our drivetrain is the core of our robot, and is easily the most important part to get right. Due to the lack of heavy objects, torque is much less important than speed. We can use a similar gear ratio to our robot during the Spin Up Season, or maybe even higher. The real question is whether we can get a six motor drive. If we can get the triball grabbing and bot lifting on two motors that would be amazing, but I'm not sure if it's possible.
  
  The weight of the drive (and the bot overall) is also very important. If we were considering a steel drivetrain before, we certainly should not be now. We need to be as light as possible to make lifting our robot as easy as possible.
  
  The ability of our bot to cross the middle line is also very important due to the ramification of having a bot of our alliance on our side of the field. If we can quickly switch sides, it will mean that we can quickly shut down our opponents defense without even interacting with their robot.
  
  #nb_heading([Programming], level: 2)
  As always, consistent chassis movement is the key to a perfect auton. Using an absolute positioning system like GPS or Odometry can make this much easier, because it allows the robot to correct for past error, or even external interference. There are also many different motion control algorithms we can use, like PID and/or motion profiling. Overall, tracking wheels and an IMU will be a must, but these sensors might have some difficulty when we cross the center line, due to the bot leaving the ground. In addition, if our robot is high off the ground, we may have some trouble getting the tracking wheels to touch the ground. 
  
  #nb_heading([John], level: 1)
  I think that the best intake for this season would easily be one with horizontal flex wheels. This would allow the bot to reach under the goal easier and also could be easier to build. We will most definitely need a shooting mechanism (a catapult would work best, and we have more experience with such building). We will also need some sort of scissor lift to lift the bot. All of these systems will require a motor, so we will need a four motor drive. This means that we can spare a motor on the claw for lifting the bot. We will want a fast drive with the center locked omni.
  
  
  #nb_heading([Alan], level: 1)
  At first I was very surprised by this game as it seemed that the results of a match would be decided in the first few seconds. However, upon further review I noticed the heavily weighted importance on match loads (22 match loads with only 12 game pieces on the field). This makes an intake that is able to get match loads necessary. I also began thinking of ways to climb the pole, as that makes up a big amount of points. My initial idea is a claw with two flex wheels on the inside, so the claw could clamp on to the pole and the wheels could rotate and drag the robot upwards. A lot of torque will be necessary but it may be doable. 


  #nb_heading([Meghana], level: 1)

  #nb_admonition(type: "note", [
    Meghana joined the team after the season started, so her thoughts may be influenced by the ideas of other teammates.
  ])

  After watching the video, I believe that we could create a strong claw mechanism which can grip the pole firmly, as it gets the most amount of points. It should be able to hold the weight as well. For the robots, they should be faster in speed but have flexible and firm wheels which can improve the accuracy of movements. Autonomous points and the winner of the autonomous period is a large headstart in the game and would also be helped by the wheels and speed.

  ]


)

#create_entry(
  title: "Identify Game Rules",
  type: "identify",
  start_date: datetime(year: 2023, month: 5, day: 13),
  [
    
  We first need to read and analyze the game rules in order to identify the challenges we'll need to solve.

  #align(center, [
    #image("/assets/field-elements/full-field.png", width: 75%)
    ])

  #nb_heading([Field Elements], level: 1)

  #grid(
    columns: (1fr, 2fr),
    gutter: 50pt,
    image("./assets/field-elements/triballs.png"),
    par([
      #nb_heading([Triballs], level: 2)
      - Can be a total of 60 triballs in play
        - 4 alliance triballs  
        - 44 match loads
        - 12 begin on the field
      - 7" radius
      - 6.18" height 
      ]),

    image("./assets/field-elements/goal.png"),
    par([
      #nb_heading([Goal], level: 2)
      - 1 per alliance
      - 47" long
      - 23.08" wide
      - low bar is 5.78" away from tiles
      ]),

    image("./assets/field-elements/barrier.png"),
    par([
      #nb_heading([Barriers], level: 2)
      - 1 long barrier
      - 2 short barriers
      - long barrier is 94.25" long
      - short barrier is 49.13" long
      - both barriers are 2.88" tall
    ]),

    image("./assets/field-elements/climbing-bar.png"),
    par([
      #nb_heading([Climbing Bar], level: 2)
      - 1 per alliance
      - consists of a high bar and a low bar
      - both bars are 2.38" in diameter
      - low bar is 21.89" long
      - low bar is 11.63" away from the tiles
      - high bar is 30.23" tall
      ]),

    image("./assets/field-elements/load-zones.png"),
    par([
      #nb_heading([Match Load Zones], level: 2)
      - 4 total
        - two per alliance
      - colored bar is 30" long
      - colored bar is 14.96" away from back corner of the field
    ]),

    image("./assets/field-elements/offensive-zones.png"),
    par([
      #nb_heading([Offensive Zones], level: 2)
      - 1 per alliance
      - does not include match load zones
      - each zone is 3 tiles by 6 tiles large
      ])

  )

  #nb_heading([Scoring], level: 1)

  - each triball in a goal is worth 5 points
  - triballs in an offensive zone are worth 2 points
  - highest climbing robot is worth 20 points
  - second highest climbing robot is worth 15 points
  - third highest climbing robot is worth 10 points
  - lowest climbing robot is worth 5 points
  - the autonomous bonus is worth 8 points

  #nb_heading([Important Rules], level: 1)

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

  #nb_heading([Conclusion], level: 1)
  Overall, Over Under is a unique and intruiging season, and we are excited to get started. We find it especially interesting that robots can only hold one triball at a time, and that triballs can be loaded directly into the robot in the load-zone. In addition, the newly legal 5.5W motors allow for a large amount of new designs that were not possible before.

  After reading through the rules we identified these capabilities that our bot will need to have:
  - Needs to be able to pick up/put down match loads.
  - Needs to be able to climb.
  - Needs to be able to complete tasks during the autonomous period.
  - Needs to be able to traverse the field.
  - Needs to be able to score triballs in offensive goal.
  ]

)

#create_entry(
  title: "Team Organization",
  type: "management",
  start_date: datetime(year: 2023, month: 5, day: 13),
  [

    #nb_heading([Design Process], level: 1)
    As stated in the pre reveal reflection we identified that our largest problem during the last season was our lack of structure and organization. In order to adress this issue we decided to have a set of steps for builders to follow while creating a system:
    - Brainstorm possible designs
    - Choose best design
    - Create design in CAD
    - Have design reviewed by fellow teamates and/or alumni
    - If the design passed review, build it
    - Test the system
    - Iterate again

    The crucial steps here are the design in CAD and review. CAD by itself cannot verify that the design will work in the real world, but the more eyes we can put on the design before building, the more mistakes we can catch. 

    Overall these two steps will make our designs much more error free, and save us time in the long run.

    #nb_heading([Schedule], level: 1)
     
    We created a schedule to get us a rough timeline of deadlines to help us meet our targets before the first competition of the season. We opted to use a Gantt chart for this because it represents the different overlapping tasks visually. This should help us meet our goal of staying more organized. Our team typically meets twice a week, for 3 hours at a time, so we've organized the chart on a weekly basis.

    #image("./assets/mermaid/gantt.svg")

    We decided to dedicate the most time to building the subsystems, as these are easily the hardest part of the robot to build. We've also planned a 4 week cutoff before the first competition to give us time to test the robot thoroughly.

    Once the first competition happens we will update this schedule further.
  ]
)

#create_entry(
  title: "Brainstorming Drivetrain Components",
  type: "brainstorm",
  start_date: datetime(year: 2023, month: 5, day: 19),
  [
    #nb_heading([Drivetrain Type], level: 1)

    #nb_heading([Tank Drive with Omni Wheels], level: 2)

    #grid(
      columns: 2,
      nb_pro_con(
        pros: [
          - turns easily
          - strong traction forwards and backwards
          - simple to build
        ],
        cons: [
          - cannot strafe
          - almost no traction side to side
        ],
      ),
      align(center,
        image("./assets/drivetrain/mecanum-drive.svg", width: 50%),
      )
    )



    #nb_heading([Tank Drive with Traction Wheels], level: 2)

    #grid(
      columns: 2,
      nb_pro_con(
        pros: [
          - strong traction forwards and backwards
          - strong traction side to side
          - simple to build
        ],
        cons: [
          - cannot strafe
          - slow turning
          ],
      ),
      align(center,
        image("./assets/drivetrain/onmi-drive.svg", width: 50%),
      )
    )


    #nb_heading([Tank Drive with Traction and Omni Wheels], level: 2)

    #grid(
      columns: 2,
      nb_pro_con(
        pros: [
          - strong traction forwards and backwards
          - strong traction side to side
          - fast turning
          - simple to build
        ],
        cons: [
          - cannot strafe
        ],
      ),
      align(center,
        image("./assets/logo.png", width: 50%),
      )
    )

    #nb_heading([Mecanum Drive], level: 2)

    #grid(
      columns: 2,
      nb_pro_con(
        pros: [
          - can strafe
        ],
        cons: [
          - slow turning
          - low traction
          - complex programming
          - large wheels take up large amount of space
        ],
      ),
      align(center,
        image("./assets/logo.png", width: 50%),
      )
    )


    #nb_heading([X-Drive], level: 2)

    #grid(
      columns: 2,
      nb_pro_con(
        pros: [
          - can strafe
          - very fast
        ],
        cons: [
          - complex programming
          - tilted wheels take up large amount of space
          - low traction
        ],
      ),
      align(center,
        image("./assets/logo.png", width: 50%),
      )
    )

    #nb_heading([Wheel Size], level: 1)

    #nb_heading([4" Wheel], level: 2)

    #grid(
      columns: 2,
      nb_pro_con(
        pros: [
          - fastest wheel
          - traverses game objects easily
        ],
        cons: [
          - low torque
        ],
      ),
      align(center,
        image("./assets/logo.png", width: 50%),
      )
    )


    #nb_heading([3.25" Wheel], level: 2)

    #grid(
      columns: 2,
      nb_pro_con(
        pros: [
          - balance of torque and speed
        ],
        cons: [
          - balance of torque and speed
          - gets stuck on game objects easily
        ],
      ),
      align(center,
        image("./assets/logo.png", width: 50%),
      )
    )


    #nb_heading([2.75" Wheel], level: 2)

    #grid(
      columns: 2,
      nb_pro_con(
        pros: [
          - high torque
        ],
        cons: [
          - low speed
          - gets stuck on game objects easily
        ],
      ),
      align(center,
        image("./assets/logo.png", width: 50%),
      )
    )

    #pagebreak()

    #nb_heading([Motor Cartridge], level: 1)

    #nb_heading([Blue Cartridge (600 RPM) ], level: 2)

    #grid(
      columns: 2,
      nb_pro_con(
        pros: [
          - very fast 
          ],
        cons: [
          - very low torque
        ],
      ),
      align(center,
        image("./assets/logo.png", width: 50%),
      )
    )

    #nb_heading([Green Cartridge (200 RPM) ], level: 2)

    #grid(
      columns: 2,
      nb_pro_con(
        pros: [
          - fast
          ],
        cons: [
          - low torque
        ],
      ),
      align(center,
        image("./assets/logo.png", width: 50%),
      )
    )

    #nb_heading([Red Cartridge (100 RPM) ], level: 2)

    #grid(
      columns: 2,
      nb_pro_con(
        pros: [
          - very high torque
          ],
        cons: [
          - very slow
        ],
      ),
      align(center,
        image("./assets/logo.png", width: 50%),
      )
    )
  ]
)

#create_entry(
  title: "Choosing Drivetrain Type",
  type: "decide",
  start_date: datetime(year: 2023, month: 5, day: 19),
  [
    #nb_heading([Drivetrain Type], level: 1)

    We placed all our options into a decision matrix in order to find the best option. We rated each option's speed, strength, and handling on a scale of 0 to 3. Speed is simply how fast the drivetrain can go. Strength is the ability of the drive to push and resist other robots. It takes into account the torque of the drive, as well as it's traction.

    #nb_decision_matrix(
      properties: ("Speed", "Strength", "Handling"),
      choices: (
        ("Omni Wheels", 2.5, 2, 2.5),
        ("Traction Wheels", 2.5, 3, 1),
        ("Traction and Omni Wheels", 2.5, 2.5, 1.5),
        ("Mecanum", 2, 1, 3),
        ("X-Drive", 2.5, 0.5, 3),
      )
    )
    #nb_admonition(type: "decision", [
      We ended up choosing the all omni drive due to its great turning and speed. While an X drive of the same gearing could be faster, the prevalence of 6 motor drivetrains means that any skid-steer chassis will be comparable have a comparable speed due to the X-Drive's inability to have more than 4 motors.
    ])
  ])

#create_entry(
  title: "Brainstorm Drivetrain Configuration",
  type: "brainstorm",
  start_date: datetime(year: 2023, month: 5, day: 19),
  [


    #nb_heading([Gear Ratio, Wheel Size, and Cartridge Type], level: 1)

    Now that we had decided on our type of drivetrain we can decide the other components. We decided on 4 combinations of gear ratio, wheel sizes and motor cartridge, which are detailed below:
    #v(40pt)
    #grid(
      columns: (1fr, 1fr),
      gutter: 5pt,
      [
        #nb_heading([6:3, 4" wheels, green cartridges], level: 2)
        - 400 RPM
        - 7 feet/second
        - 14" long
        #nb_pro_con(pros: [
          - very fast
          - large wheels make traversal easier
          ], cons: [
          - low torque
          ])
      ],
      image("./assets/drivetrain/6:3-4.png"),

      [
        #nb_heading([3:5, 3.25" wheels, green cartridges], level: 2)
        - 360 RPM
        - 5.1 feet/second
        - 14" long
        #nb_pro_con(pros: [
          - higher torque
          ], cons: [
          - small wheels make traversal difficult
          - slow
          ])

      ],
      image("./assets/drivetrain/3:5-3_25.png"),

      [
        #nb_heading([3:5, 4" wheels, green cartridges], level: 2)
        - 360 RPM
        - 6.47 feet/second
        - 14" long
        #nb_pro_con(pros: [
          - speed
          - compact gears
          ], cons: [
            - low torque
          ])
      ],
      image("./assets/drivetrain/3:5-4.png"),

      [
        #nb_heading([4:7, 4" wheels, green cartridges], level: 2)
        - 342 RPM
        - 6.17 feet/second
        - 14" long
        #nb_pro_con(pros: [
          - speed
          - large wheels make traversal easier
          ], cons: [
            - low torque
          ])

      ],
      image("./assets/drivetrain/4:7-4.png"),

    )

])

#create_entry(
  title: "Choose Drivetrain Configuration",
  type: "decide",
  start_date: datetime(year: 2023, month: 5, day: 19),
  [
    We then rated each configuration for it's speed, strength, and maneuverability on a scale of 0 to 5.

    #nb_decision_matrix(
      properties: ("Speed", "Strength", "Maneuverability"),
      choices: (
        ("6:3, 4\" wheels, green cartridges", 5, 2, 3),
        ("3:5, 3.25\" wheels, blue cartridges", 3, 4, 2),
        ("3:5, 4\" wheels, blue cartridges", 0, 0, 0),
        ("4:7, 4\" wheels, blue cartridges", 3.5, 4, 3),
      )
    )

    #nb_admonition(type: "note", [
      While mocking up the designs in CAD we discovered that the drivetrain with the 3:5 gear ratio and the 4" wheels could not be built due to some of its gears not meshing. This is an excellent example of how our work with CAD is already paying off. If we had discovered this issue while building it would have taken much longer to fix.
    ])


    #nb_admonition(type: "decision", [
      We settled on a drivetrain with a 4:7 gear ratio, 4" wheels, and blue cartridges, leaving us with a final RPM of 360, and a final speed of 6.7 feet/second.
    ])

    #nb_heading([Final Drivetrain Design], level: 1)

    #align(center, [
      #image("./assets/drivetrain/drivetrain-cad-side.png", width: 80%)
      #image("./assets/drivetrain/drivetrain-cad-top.png", width: 75%)
    ])

    #pagebreak()

    #align(center, [
      #image("./assets/drivetrain/drivetrain-drawing.png") \
    ])

  ]
)

#create_entry(
  title: "Building the Drivetrain",
  type: "build",
  start_date: datetime(year: 2023, month: 6, day: 14),
  end_date: datetime(year: 2023, month: 6, day: 22),
  [
  We did some pretty cool stuff
  ]
)
