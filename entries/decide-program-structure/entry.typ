#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Decide: Program Structure",
  type: "decide",
  date: datetime(year: 2023, month: 8, day: 12),
  author: "Felix Hass",
  witness: "Alan Morales",
)

We rated each option by:
- Scalability on a scale of 0 to 5
- Simplicity on a scale of 0 to 3
- Asynchrony on a scale of 0 or 5

We rated scalability so high due to the high planned complexity of our program.
We want many features like position tracking and movement algorithms, and
scalability allows us to have an over all lower complexity with a larger
codebase.

We rated asynchrony so high because we really do not want some parts of the
programs to block others when not needed. This will allow us to have move
complex control loops without causing problems.

#decision-matrix(
  properties: ("Scalability", "Simplicity", "Asynchrony"),
  ("Option 1", 5, 1, 5),
  ("Option 2", 3, 2, 0),
  ("Option 3", 0.5, 3, 0),
)

#admonition(
  type: "decision",
)[

  We ended up choosing option 3 due to its high scalability and ability to support
  asynchronous code. This is also the approach we used during the Spin Up season,
  so we have experience using it.]

= Implementation

== State Machine

A state machine is a simple and robust way to handle a system that can be in
many states. We decided to use this approach after realizing that each subsystem
can only be in 1 state at a time. For example a catapult might have the
following states:
- Loading
- Ready
- Firing

The catapult cannot be loading and ready, or loading and firing, or any other
combination of the 3. These states are perfectly modeled as an enumeration.

```cpp
enum class CatapultState {
  Loading,
  Ready,
  Firing,
}
```

We can then make a variable that tracks the current state and then have the
system change based on the current state.

```cpp
CatapultState current_state = CatapultState::Loading;
while(true) {
  switch (current_state) {
  case CatapultState::Loading: {
    // Load the catapult
    break;
  }
  case CatapultState::Ready: {
   // Ready the catapult
    break;
  }

  case CatapultState::Firing: {
    // Fire the catapult
    break;
  }
  }
}
```

== Tasks

Making each subsystem into a task presents some problems:
- We want to be able to choose when the task starts so that we can choose to have
  other processes start before it.
- Concurrency (the tasks cannot interfere with each other)

The first problem is surprisingly the hardest to solve. The PROS's Task class
takes a callback to another function in order to be constructed. However the
address of that function needs to be known at compile time in order for this to
work. This means that if the function is part of a class (its a method) it must
be static. However this conflicts with our goal because we want to start the
task at runtime.

The solution to this is to define the task as nullptr originally, and then
initialize it later with a lambda function, which looks like this:

```cpp
if (task == nullptr) {
  task = new pros::Task([=] {
    while (true) {
      loop();
    }
  });
}
```

== File Structure

Due to how PROS projects are structured we are forced to have `src/` and
`include/` be the top level directories for our body files and header files
respectively. However inside those directories we can organize our project
however we choose.

We chose to have `src/` and `include/` mirror each to make it clearer which body
and header files go together.

Inside the top level directory we have a `lib/` directory, which contains all of
our utility code. `lib/` contains `subsystems/` and `utils/`. `subsystems/`
obviously contains all of our classes for our subsystems. `utils/` contains
utility functions and classes for things like mathematical conversions.

== Style Guide

We chose to implement a style guide in order to write cleaner, more consistent
code. We chose to base our style guide off of Google's C++ Style Guide #footnote(link("https://google.github.io/styleguide/cppguide.html")),
with a few exceptions. We will document these in our project's README. #footnote(link("https://github.com/Area-53-Robotics/53E#readme"))
