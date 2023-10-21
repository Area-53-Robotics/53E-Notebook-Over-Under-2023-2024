#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Brainstorm: Position Tracking",
  type: "brainstorm",
  start_date: datetime(year: 2023, month: 7, day: 28),
)[
  Now that we chose our sensor configuration we chose how we wanted to implement
  absolute tracking. The most popular method of doing this was first pioneered by
  team 5225, the $pi$lons. They wrote a document describing their implementation
  process, which can be found here: #link("http://thepilons.ca/wp-content/uploads/2018/10/Tracking.pdf").

  Since the release of this document there have been many libraries that have
  implemented it, each in their own way.

  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    [
      #nb_heading([DIY Implementation], level: 2)
      #nb_pro_con(pros: [
        - Gives us a lot of control
      ], cons: [
        - Requires lots of troubleshooting and development time
      ])
    ],
    [],
    [
      #nb_heading([LemLib], level: 2)
      #nb_pro_con(pros: [
        - Actively maintained
        - Supports our current sensor configuration
        - Supports many different movement algorithms
      ], cons: [
        - Not in a stable state
      ])
    ],
    [],
    [
      #nb_heading([ARMS], level: 2)
      #nb_pro_con(pros: [
        - Supports our sensor configuration
      ], cons: [
        - Not actively maintained
      ])
    ],
    [],
    [
      #nb_heading([OkapiLib], level: 2)
      #nb_pro_con(
        pros: [
          - Provides many useful utilities like filters and asynchronous controllers
          - Included in PROS by default
        ],
        cons: [
          - Does not support our sensor configuration
          - Not actively maintained
        ],
      )
    ],
    [],
  )

]

