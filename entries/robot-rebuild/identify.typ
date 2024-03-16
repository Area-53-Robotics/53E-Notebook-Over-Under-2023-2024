#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *
#import "/utils.typ": grid

#show: create-body-entry.with(
  title: "Identify: Robot Rebuild",
  type: "identify",
  date: datetime(year: 2024, month: 3, day: 5),
  author: "Felix Hass",
  witness: "Alan Morales",
)

= Current Problems

We haven't had enough time between competitions to be able to make major changes
to our bot, but we have an approximately two month timeline before worlds, so we
decided a total rebuild was in order.

We broke down the issues on our current robot that we'd like to address in our
rebuild.

== Robot Weight

#grid(
  columns: (1fr, 2fr),
  [
    One of the things we foolishly didn't take into account from the beginning of
    the season is the weight of the robot.

    At this moment in time we don't know the exact weight of our robot, but we
    estimate it to be around 18 pounds.

    This is extremely heavy for a vex robot, and has caused a lot of problems for
    us. It limits how fast we can accelerate, puts more stress on the motors, and
    makes the lift very inconsistent.

  ],
  figure(image("./full-iso.png"), caption: "Full robot CAD"),
)

== Drivetrain Towers

The motors on our drivetrain are mounted above the main drivetrain c-channel, on
towers constructed of standoffs and smaller c-channel. While this may not seem
like a massive issue, it has been the source of numerous problems for us.

Not only do they increase weight, but they also make it extremely difficult to
find easy mount points on top of the drivetrain. This has massively increased
the development and build time of every single one of our subsystems.

#figure(
  image("./towers-side.png", width: 50%),
  caption: "Drivetrain: Side View",
)

== Lift
#grid(
  [
    While the lift is mostly working, its nowhere near perfect. The flywheel mounted
    to the end of it greatly increases its weight, and it dramatically limits
    movement of the robot when extended.

    In addition, the lift isn't powerful enough to pull our robot above A tier. We
    haven't seen very many teams be able to achieve higher than that without a motor
    lift, so we're not sure if a pneumatic lift is the way forward.

  ], //
  figure(image("./lift-side.png"), caption: "Lift: Side View"),
)

== Flywheel

#grid(
  figure(image("./flywheel-front.png"), caption: "Flywheel: Front View"),
  [
    The flywheel was an essential part of our strategy earlier in the season, but is
    no longer as useful. Now that field starvation strategies are more prevalent,
    shooting during matches is almost completely unnecessary.

    This makes our flywheel only useful during skills, where its very low accuracy
    is a very large weakness.

    Our decision to mount it to the end of the lift was also a major mistake. Almost
    no team is running blockers anymore, so having a lifted shooter is basically
    useless.

  ],
)

= Goals

Originally we were unsure whether we wanted to build a bot that prioritizes
skills, or match play. These robots would look extremely different, so we wanted
to figure out what was important to us.

Eventually we decided that we wanted a robot that could do both. While we may
end up having more weight on our robot because of this decision, we have some
strategies to keep us under our projected limit.

- Be able to perform well in both match play and during skills. This means having
  a mix of subsystems that support both.
- Keep the robot under 12 pounds.
- Push the boundaries of what our team has been able to do in the past. If there's
  a more optimal solution that's more complex, we'd like to attempt it.
