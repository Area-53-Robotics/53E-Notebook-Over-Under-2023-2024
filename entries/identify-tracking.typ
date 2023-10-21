#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Identify: Position Tracking",
  type: "identify",
  start_date: datetime(year: 2023, month: 7, day: 28),
)[
  During our Tipping Point and Spin Up seasons all of our tracking in the
  autonomous period was 1 dimensional and relative. This meant that the robot
  could only track its position in a straight line, and was only aware of its
  position in relation to its last position. This made it very easy for error to
  build up, especially if movements were not totally accurate.

  We decided that in order to solve this problem we would need an absolute
  positioning system. This would track the robot's position in Cartesian
  coordinates throughout the entire match. This has a couple advantages over our
  past system.
  - Tracking is now 2 Dimensional, allowing for more complex movement algorithms
  - Allows for movements to be made in regard to specific points on the field
  - Allows for correction of past error

  #align(
    center,
  )[
    #figure(
      caption: "Depicted: the robot's position in the field measured in tiles",
    )[
      #image("/assets/odometry/absolute-tracking.svg", width: 75%)
    ]
  ]

  #nb_heading([Design Constraints], level: 1)
  - Must use official Vex sensors
  - Sensors used must keep the robot within an 18" by 18" by 18" cube

  #nb_heading([Design Goals], level: 1)
  - Stay under 1" of error after moving for 24'

]

