#import "/packages.typ": notebookinator, codetastic
#import notebookinator: *
#import themes.radial.components: *

#import codetastic: qrcode

#show: create-body-entry.with(
  title: "Decide: Autonomous Routes",
  type: "decide",
  start-date: datetime(year: 2023, month: 11, day: 28), // TODO: fix date
)

= Match Autons

After identifying that AWP #footnote[See Glossary] is the most important thing
we can accomplish during the autonomous period, we need some routes to follow.
We cannot do all the AWP tasks ourselves because they require us to be on both
sides of the field. This means that we'll have to prepare two different
autonomous routines, one for each side of the field. We used a piece of software
called PATH.JERRYIO #footnote(qrcode("https://github.com/Jerrylum/path.jerryio", size: 2pt)) to
plan all of our routes.

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
    == Offensive

    The offensive side route performs two tasks: scoring the alliance triball, and
    touching the elevation bar. First we move forward, and then we turn to face the
    goal. We push our preloaded triball into the goal. Once this is done, we drive
    over to the barrier, and extend our flaps to touch the bar.
  ],
  image("./offensive.png"),
  image("./defensive.png"),
  [
    == Defensive
    The defensive side auton is slightly more complicated. It performs two of the
    AWP tasks, and scores an alliance triball in the opposing goal.
    #admonition(
      type: "note",
    )[
      Even though we are scoring a triball in this auton, this does not count as a
      solo AWP, because the rules stipulate that the goal must be our alliance goal.

    ]
  ],
)

= Skills Auton

The skills autonomous route is much more complex than the other two, since it
lasts for a whole minute. Our strategy is to shoot all of our match loads, and
then attempt to push as many of the triballs into the goal as possible.

#image("./skills.png", width: 70%)

We first move to the match load bar, and then delay until all of the triballs
have been fired. Once we do that we move across the entire field, expand our
wings, and drive against the goal. At this point there will be so many triballs
on that side of the field that we are almost guaranteed to get some into the
goal, especially the extra reach our wings give us. We repeat this motion a
second time on the front of the goal.