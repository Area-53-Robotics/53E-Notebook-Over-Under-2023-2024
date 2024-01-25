#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Program: Lift",
  type: "program",
  date: datetime(year: 2024, month: 1, day: 16),
)

```hpp
#pragma once

#include "api.h"
#include "lib/utils/state_machine.hpp"
#include "lib/utils/task-wrapper.hpp"

namespace lib {

enum class HangState { Expanded, Idle };

class Hang : public StateMachine<HangState>, public TaskWrapper {
 public:
  Hang(std::shared_ptr<pros::ADIDigitalOut> piston);

  void toggle();

 private:
  std::shared_ptr<pros::ADIDigitalOut> piston;
  void loop() override;
};
}  // namespace lib
```


```cpp
#include "lib/subsystems/hang.hpp"

#include <cstdio>
namespace lib {
Hang::Hang(std::shared_ptr<pros::ADIDigitalOut> i_piston) {
  piston = i_piston;
};

void Hang::loop() {
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
