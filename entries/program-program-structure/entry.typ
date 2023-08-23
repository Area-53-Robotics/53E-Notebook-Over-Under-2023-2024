#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
title: "Program: Program Structure",
type: "program",
start_date: datetime(year: 2023, month: 8, day: 12)
)[


During Spin Up we had to have a large amount of boilerplate for each state machine we wanted to create. In order to fix this problem we've made an abstract StateMachine class that the subsystems can inherit. This means that we can define the state machine structure once, and then use it in a bunch of other places. 

This solution was inspired by Theo from team 7842B #footnote(link("https://theol0403.github.io/7842B-Journal/2019-10-16/statemachine/")), and Ryan from team 4253B #footnote(link("https://github.com/Ryan4253/RaidZeroLib/blob/bb9f94f087cae19f22a3d8048642b198f45b7fa1/include/RaidZeroLib/Utility/StateMachine.hpp#L1"))

This solution uses a mutual exclusion #footnote("See glossary.") (mutex) in order to restrict access to the state to one task at a time. This makes the state safe from data races, in which multiple tasks race to read or modify the same variable.

```cpp
// state_machine.hpp
#pragma once
#include "pros/rtos.hpp"
#include "pros/screen.hpp"

namespace lib {

// TODO: split this into a body file

template <typename State, State init_state = State::Idle>
class StateMachine {
 private:
  State state = init_state;
  pros::Mutex state_lock; // Define the mutex

 public:
  StateMachine() {}


  State get_state() {
    state_lock.take(); // Only one task can take a mutex at a time
    State current_state = state;
    state_lock.give(); // Once its given back another task can take it
    return current_state;
  }

  void set_state(State new_state) {
    state_lock.take();
    state = new_state;
    state_lock.give();
  }
};

}
```

We took the same approach for the task wrapper and made it it's own class. This is also inspired by Theo. #footnote(link("// https://theol0403.github.io/7842B-Journal/2019-10-18/task-wrapper/"))

```cpp
// task_wrapper.hpp
#pragma once
#include <cstdio>
#include <memory>

#include "pros/rtos.hpp"

namespace lib {

class TaskWrapper {
 protected:
  virtual void loop() = 0; // Will be overridden later

 public:
  void start_task();

 private:
  pros::Task *task{nullptr}; // We don't want the task to start right away
};

}  // namespace lib
```

```cpp
// task_wrapper.cpp
#include "lib/utils/task-wrapper.hpp"

namespace lib {

void TaskWrapper::start_task() {
  if (task == nullptr) {
    task = new pros::Task([this] {
      while (true) {
        this->loop();
      }
    });
  }
}

};  // namespace lib
```

With these two defined we can now define a subsystem. We made a mock catapult to showcase our new capabilities.

```cpp
// catapult.hpp
#pragma once
#include <memory>

#include "lib/utils/state_machine.hpp"
#include "lib/utils/task-wrapper.hpp"
#include "pros/motors.hpp"

namespace lib {

enum class CatapultState { Idle, Loading, Ready, Firing };

class Catapult : public lib::StateMachine<CatapultState>, public TaskWrapper { // Inherit both classes here
 public:
  Catapult(std::shared_ptr<pros::Motor> i_motor); // We take a pointer to the motor instead of a port to avoid having to configure it
  ~Catapult();

 private:
  std::shared_ptr<pros::Motor> motor;

 protected:
  void loop() override;
};

}  // namespace lib
```

```cpp
// catapult.cpp
#include "lib/subsystems/catapult.hpp"

#include <cstdio>

#include "pros/rtos.hpp"

namespace lib {

Catapult::Catapult(std::shared_ptr<pros::Motor> i_motor) : motor(i_motor){};
Catapult::~Catapult(){};
void Catapult::loop() {
  while (true) {
    if (get_state() == CatapultState::Idle) {  // State machine
      printf("just chillin\n");
    }
    pros::delay(20);
  }
};
}
```

]
