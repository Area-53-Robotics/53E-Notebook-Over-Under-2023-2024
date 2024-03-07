#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Identify: Scoring Triballs",
  type: "identify",
  date: datetime(year: 2023, month: 9, day: 1),
  author: "Alan Morales",
  witness: "Violet Ridge",
)

Getting the triballs into the goal is a very important task. As covered in the
rules section at the beginning of the notebook, each triball scored in our
alliance's goal gives us 5 points. This makes it very important that we can get
as many triballs into the goal as fast as possible.

#image("./scoring-triballs.svg", height: 50%)

#heading([Design Constraints], level: 1)

- The design is constrained by the 36 inch expansion limit
- We only want to use two pneumatic pistons.

#heading([Design Goals], level: 1)

- Fold out from a position parallel with the side of the robot in less than a
  second.
- Be stable enough to push 6 tri-balls into the goal at once from directly in
  front of the goal.
- Be able to pull triballs out of the loading area fairly easily and quickly.
- It should be able to do all of the above WITHOUT moving the triballs when
  turning (otherwise it counts as possession).
