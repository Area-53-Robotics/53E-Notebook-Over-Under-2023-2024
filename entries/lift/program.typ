#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Program: Lift",
  type: "program",
  date: datetime(year: 2024, month: 1, day: 16),
  author: "Meghana Noojipady",
  witness: "Felix Hass",
)

Now that the lift is built, we can write the code for it. The code is relatively
simple, and uses roughly the same code as the wings. We use our standard state
machine and asynchronous organization.

Here's the header file for the lift, located at
`include/lib/subsystems/hang.hpp`:

```hpp
#pragma once

#include "api.h"
#include "lib/utils/state_machine.hpp"
#include "lib/utils/task-wrapper.hpp"
namespace lib {

enum class HangState { Expanded, Idle }; // The lift can only ever be up or down

class Hang : public StateMachine<HangState>, public TaskWrapper { // Inherit the state machine and task classes
 public:
  Hang(std::shared_ptr<pros::ADIDigitalOut> piston);

  void toggle();

 private:
  std::shared_ptr<pros::ADIDigitalOut> piston;
  void loop() override;
};
}  // namespace lib
```
Here's the body file for the lift, located at `src/lib/subsystems/hang.cpp`:

```cpp
#include "lib/subsystems/hang.hpp"

namespace lib {
Hang::Hang(std::shared_ptr<pros::ADIDigitalOut> i_piston) {
  piston = i_piston;
};

void Hang::loop() { // The main loop that drives the lift
  switch (get_state()) {
    case HangState::Expanded:
      piston->set_value(true);
      break;
    case HangState::Idle:
      piston->set_value(false);
      break;
  }
}

void Hang::toggle() {
  if (!(get_state() == HangState::Expanded)) {
    set_state(HangState::Expanded);
  } else {
    set_state(HangState::Idle);
  }
}

}  // namespace lib
```

With this code written we can then very simply control the lift in driver
control. We simply call the lift's `toggle()` method, and the lift will switch
states.

```cpp
// Hang control
if (controller.get_digital_new_press(pros::E_CONTROLLER_DIGITAL_B)) { // Bind the hang toggle to the "B" button
  controller.rumble("."); // Provide the driver with haptic feedback
  hang.toggle();
}
```
With these changes, our new controller layout looks like this:
#image("./control-layout.svg")
We decided not to put the lift on a trigger because the driver will need to use
it much less than any of the other functions.
