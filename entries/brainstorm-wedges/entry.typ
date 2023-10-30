#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Brainstorm: Pushing Robots",
  type: "brainstorm",
  start_date: datetime(year: 2023, month: 8, day: 31),
  end_date: datetime(year: 2023, month: 9, day: 3),
)[
  Most robot designs that we've seen use a mechanism that lifts the other robot so that they are at an angle. This gives us mechanical advantage against them, as shown below:
  #image("./free-body-diagram.svg", width: 50%)

  As you can see from the diagram above, the force normal force on the robot pulls it backwards, using their own weight to our advantage. This also gives them less friction against the field tiles, reducing the amount of force they can exert against us.

  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    [
      #nb_heading([Wedges], level: 1)

      This design consists of either a plastic plate or two high strength axles in order to lift the opponent's robot so that they're at an angle. This design is used by many robots, including 515R's Spin Up robot #footnote(link("https://www.youtube.com/watch?v=UZGtNiJYn38")), and 606X's Spin Up robot #footnote(link("https://www.youtube.com/watch?v=BpEzAX6E2_g&t=20s")).
      #nb_pro_con(
        pros: [
          - It can double as a skirt.
          - It is used by many teams.
          - The slant gives our robot mechanical advantage while pushing other robots.
          - The shape is simple to design.
        ],
        cons: [
          - It is hard to mount because there are no flat surfaces.
          - The design will possibly require reinforcement of the robot.
          - It is unoriginal.
        ],
      )

    ],
    image("./wedges.svg"),
    [
      #nb_heading([Snow Plow], level: 1)

      This design consists of a curved plate at the front of the robot. It works similarly to the wedges except its concave instead of flat.

      #nb_pro_con(pros: [
        - It is slanted at the bottom to give mechanical advantage.
        - The back is flat and will be easier to mount.
        - It could possibly double as a skirt.
      ], cons: [
        - The shape is odd and would be hard to create.
        - The protrusion at the top may limit the effectiveness.
        - Not as slanted as the wedges.
        - It would not allow the robot to go over the barrier.
      ])
    ],
    image("./plow.svg"),
    [
      #nb_heading([Arms], level: 1)

      This design involves a piece of metal or plastic at 90#sym.degree  mounted to the front of the robot.

      #nb_pro_con(
        pros: [
          - The back is flat and would be easy to mount.
          - If mounted really close to the floor it would be able to slide easily under a
            skirt.
          - It can help to push other robots.
        ],
        cons: [
          - Not slanted, forfeiting mechanical advantage
          - Would not allow the robot to go over the barrier.
        ],
      )
    ],
    image("./forklift.svg"),
  )
]
