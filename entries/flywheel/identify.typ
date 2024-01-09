#import "@local/notebookinator:0.1.0": *
#import themes.radial.components: *

#show: create_body_entry.with(
  title: "Identify: Launcher Rebuild",
  type: "identify",
  start_date: datetime(year: 2023, month: 11, day: 28),
)

At our last tournament we were very unhappy with the performance of our catapult. It wasn't able to shoot the triballs far enough to cross the barrier, forcing us to consistently play the offensive side of the field. 

We want to redesign our shooting mechanism to be able to shoot across the field, in order to score triballs directly from the match load bar. This will make it easy for our alliance partner to play on the offensive side of the field.

#image("./identify.svg")

= Design Constraints

Our design must be:
- Shorter than the elevation bar 
- Only use 1 motor

= Design Goals

We want our new design to be able to shoot the triballs all the way across the field from the match load bar.
