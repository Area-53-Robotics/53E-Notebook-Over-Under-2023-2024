#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Identify: Moving Triballs",
  type: "identify",
  date: datetime(year: 2023, month: 9, day: 5),
  author: "John Kelley",
  witness: "Alan Morales",
)

After discussing for a bit we realized that the only mechanism that would be
able to meet our goal of being able to get the triballs across the field in
under 5s is some kind of shooting mechanism.

= Options

#grid(columns: (1fr, 1fr), gutter: 20pt, [
  == Puncher

  #pro-con(pros: [
    - Powerful (can reliably shoot under goal)
    - Easy to tune
  ], cons: [
    - Take up a lot of horizontal space
  ])

], image("/assets/launchers/puncher.svg", width: 90%), [

  == Catapult

  #pro-con(pros: [
    - We have experience building them
    - Powerful enough to shoot under goal
    - Easy to tune
  ], cons: [
    - Takes up a lot of space
  ])
], image("/assets/launchers/catapult.svg", width: 90%), [

  == Flywheel

  #pro-con(pros: [
    - Very accurate speed control
  ], cons: [
    - Easily burn out if not given enough power
    - Difficult to correctly tune
  ])
], image("/assets/launchers/flywheel.svg", width: 90%))
