#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Management: Road to Worlds",
  type: "management",
  date: datetime(year: 2024, month: 3, day: 5),
  author: "Meghana Noojipady",
  witness: "Felix Hass",
)

We have about 2 months until Worlds, and so we need to plan out the
timeline that we will follow to be as prepared as we can, as well as accomplish
our bot rebuild in a timely manner with time to test and program as well. 

= Priorities

We have decided that our new bot will be a smaller, swifter, and stronger bot. It 
will have a 6 motor PTO which will need a lot of time, as well as a 6 motor drivetrain, 
puncher, and sleds with wedges on the intake side of our bot. 

We've decided that the PTO and hang will be the most important aspects of our new bot, but
we will need proper time management, efficient work, and organized planning skills to have
this new bot built successfully and in time for worlds. 

Our old bot will stay assembled so that as we build our new bot, we can use the old bot
for programming and driver practice so that we don't have to stress about getting
enough time after rebuild for bot skills practice and driver/auton practice and testing. 

Any remaining time would be allocated to driver and autonomous practice.

= Gantt Chart

We've created a Gantt chart to visualize what we've planned for task assignments and time frames:

#gantt-chart(
  start: datetime(year: 2024, month: 3, day: 4),
  end: datetime(year: 2024, month: 4, day: 2),
  date-interval: 7,
  tasks: (
    ("Drivetrain CAD", (0, 1)),
    ("Drivetrain Build", (1, 2)),
    ("Wenchclimb CAD", (1, 2)),
    ("Wenchclimb Build", (2, 3)),
    ("Wings CAD", (2, 3)),
    ("Wings Build", (3, 4)),
    ("Sleds CAD", (0, 1)),
    ("Sleds Build", (1, 2)),
    ("Intake CAD", (2, 3)),
    ("Intake Build", (3, 4)),
    ("Kicker CAD", (1, 2)),
    ("Kicker Build", (2, 3)),
    ("Wedges CAD", (2, 3)),
    ("Wedges Build", (3, 4)),
    ("PTO CAD", (2, 3)),
    ("PTO Build", (3, 5)),


  ),
  goals: (("Worlds Tournament", 8),),
)
