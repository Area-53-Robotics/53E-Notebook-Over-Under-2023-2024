#import "@local/notebookinator:0.1.0": *
#import themes.radial.components: *

#import "@preview/cetz:0.1.2"

#show: create-body-entry.with(
  title: "Identify: Autonomous Strategy",
  type: "identify",
  start-date: datetime(year: 2023, month: 12, day: 1),
)

The autonomous period is a essential part of the game. It can give you a head
start on the match itself, and the autonomous bonus can even decide close games.

= Points Breakdown

Here's a breakdown of the total amounts of points possible for each task. We
assume 6 triballs is the amount for each triball related goal.

#grid(
  columns: (2fr, 1fr),
  gutter: 20pt,
  pie-chart(
    (value: 10, color: blue, name: "Auton bonus"),
    (value: 30, color: green, name: "Triballs in goal"),
    (value: 12, color: red, name: "Triballs in offensive zone"),
  ),
  [
    Overall scoring triballs in the goal is the most efficient way to score points
    during the autonomous period.
  ],
)

= AWP

AWP (autonomous win point) is another possible task to complete during the
autonomous period. It awards an additional win point for completing several
tasks. Win points are the primary way teams are ranked during qualification
matches.

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  pie-chart(
    (value: 1, color: yellow, name: "Tie"),
    (value: 2, color:  green, name: "Win"),
    (value: 1, color: blue, name: "AWP")
  ),
  [
    The maximum possible amount of win points we can score during a match is 3, but
    even if we lose, AWP gives us the same amount of points that we would have
    gotten had we tied the match. Overall, AWP is a super powerful tool that can get
    us ahead in tournaments even if we lose matches.
  ],
)

The following tasks are required to get AWP:
- Score a triball in your alliance goal
- Remove the triball from your alliance match load zone
- Touch the elevation bar

= Conclusion

Overall going for AWP seems like a much safer bet to getting us ahead, even if
the tasks cannot be accomplished by a single robot. We'll need 2 different
autonomous routines to be able to accommodate for any alliance partner we'll be
paired with.
