#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Management: Road to States",
  type: "management",
  date: datetime(year: 2024, month: 2, day: 11),
)

We have a limited amount of time before states, so we need to plan out the
timeline we want to follow in 4 weeks we have leading up to it.

= Priorities

Based on what we've seen at the three consecutive tournaments we've been to,
performance during the autonomous period and driver experience are much more
important than the build of the robot.

We decided that the issues on the intake were the highest priority subsystem
that needed repairing, so we allocated a week to redesign and build it. This is
by far our most used subsystem, so we need to make sure that it works 100% of
the time.

Any remaining time would be allocated to driver and autonomous practice.

= Gantt Chart

We've created a Gantt chart to visualize what we've planned:

#gantt-chart(
  start: datetime(year: 2024, month: 2, day: 10),
  end: datetime(year: 2024, month: 3, day: 2),
  date-interval: 7,
  tasks: (
    ("Intake Rebuild", (0, 1)),
    ("Autonomous Skills", (1, 4)),
    ("Driver Practice", (1, 4)),
  ),
  goals: (("State Championship", 4),),
)
