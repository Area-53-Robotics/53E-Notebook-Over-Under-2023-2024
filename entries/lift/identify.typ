#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Identify: Elevation",
  type: "identify",
  date: datetime(year: 2024, month: 1, day: 03),
)

After the Capital Beltway Challenge, we decided that our robot needed some way
to elevate. We noticed that not many teams were able to elevate at all, even this late into the season, meaning that we can still score near maximum points by elevating.

#image("./identify.svg")

= Design Goals

- Achieve at least a B tier elevation
- Be able to elevate within the last 10 seconds of the match

= Design Constraints

- Our elevation mechanism must start deployed with an 18" cube, and cannot
  increase the robot's size to more than 36" across when extended
- Our robot is currently using all 88Ws of its allowed motors, meaning that we
  need to either reallocate motors, or not use them at all
