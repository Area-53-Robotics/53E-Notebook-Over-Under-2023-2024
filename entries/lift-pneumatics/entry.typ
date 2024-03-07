#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Build: Lift Pneumatics",
  type: "build",
  date: datetime(year: 2024, month: 3, day: 1),
  author: "John Kelley",
  witness: "Violet Ridge",
)

= Problem

While using the lift, we noticed that it consistently ran out of air before the
end of the match. We had it wired in its own pneumatic system, with its own
tank, to keep it separate from the wings, but this didn't appear to help.

We usually had enough air to push it up once and pull it down once. This mean
that if we wanted to hang, we'd have to keep the lift up for the entire match,
dramatically limiting movement.

Here is a diagram of our current wiring:

#image("./wiring-0.svg", width: 50%)

We use 1 double acting solenoid to power the lift. This means that the lift uses
air on both the up and down stroke.

= Solution

Since the lift has rubber bands on it, we decided that it was wasteful to use
the double acting capabilities of the piston unless we were trying to elevate.
This means we needed some way to only use the double acting capabilities at the
very end of the match.

The solution we came up with was to put a single acting solenoid in the tubing
between the double acting solenoid and the pistons.

== Wiring

#grid(
  columns: (1fr, 1fr),
  gutter: 20pt,
  [
  When the piston needs to be extended, the air flows through the `P` and `B`
  ports of the solenoid, causing the piston to extend.

  This behaves exactly like it did before we made the wiring changes.
  ],
  image("./wiring-1.svg"),
  [
  When we want the piston to retract, but we don't need the extra power to pull
  the robot into the air, we completely cut off air to the piston.

  The double acting solenoid allows air to flow from `P` to `A`, but the single
  acting solenoid blocks it, saving us air.

  The rubber bands and gravity then pull the whole lift down.
  ],
  image("./wiring-2.svg"),
  [
  When we want to lift the robot into the air, we need the extra power of the
  double acting piston. We open both the double acting solenoid and the single
  acting one, allowing the air to flow from `P` to `A` in the double acting
  solenoid, and then from `P` to `A` in the single acting solenoid.

  This pulls the lift down with both the force of the rubber bands, and the air in
  the canisters, pulling the robot into the air.
  ],
  image("./wiring-3.svg"),
)

== Code

The code for this ended up being relatively simple:

```cpp
void Hang::loop() {
  switch (get_state()) {
    case HangState::Expanded:
      piston->set_value(true);
      extra_piston->set_value(false);
      break;
    case HangState::Idle:
      piston->set_value(false);
      extra_piston->set_value(false);
      break;
    case HangState::Boosted: // Should only happen at the end of the match
      piston->set_value(false);
      extra_piston->set_value(true);
      break;
  }
}
```
