#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Program: Autonomous Movement",
  type: "program",
  start_date: datetime(year: 2023, month: 9, day: 11),
)[

  With the majority of the complex code handled by LemLib, getting set up is
  relatively simple.

  ```cpp
      // Ommitted old chassis configuration
      // ...

      // Define PID constants

      // forward/backward PID
      inline lemlib::ChassisController_t lateralController {
          8, // kP
          30, // kD
          1, // smallErrorRange
          100, // smallErrorTimeout
          3, // largeErrorRange
          500, // largeErrorTimeout
          5 // slew rate
      };

      // turning PID
      inline lemlib::ChassisController_t angularController {
          4, // kP
          40, // kD
          1, // smallErrorRange
          100, // smallErrorTimeout
          3, // largeErrorRange
          500, // largeErrorTimeout
          0 // slew rate
      };

      ```

  With these defined moving the chassis is incredibly simple.

  ```cpp
      // Move the chassis to (10, 40) at 35 degrees with a timeout of 2 seconds.
      chassis.moveTo(10, 40, 25, 20000);

      // Move the chassis backwards to (0, 0) at 0 degrees with a timeout of 2 seconds.
      chassis.moveTo(0, 0, 0, 20000, false, false);
      ```

]
