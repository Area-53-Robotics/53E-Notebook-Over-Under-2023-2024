#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Program: Position Tracking",
  type: "program",
  start_date: datetime(year: 2023, month: 8, day: 20),
)[
  In order to get the position tracking working we first had to install LemLib. We
  followed the installation instructions #footnote(
    link(
      "https://lemlib.github.io/LemLib/md_docs_tutorials_1_getting_started.html",
    ),
  ) and downloaded the zip file for the 0.4.7 release. Then we ran the following
  commands to apply the template: ```shell-unix-generic
  pros c fetch LemLib@0.4.7.zip
  pros c apply LemLib@0.4.7
  ```

  We then had to configure the chassis.

  The first thing we had to do was configure the drivetrain. ```cpp
  inline pros::Motor_Group left_motors({-11, 12, -15});
  inline pros::Motor_Group right_motors({1, -2, 3});

  inline lemlib::Drivetrain_t drivetrain{
      &left_motors,   // left drivetrain motors
      &right_motors,  // right drivetrain motors
      10,             // track width // TODO:  measure this value correctly
      4,              // wheel diameter
      342.85          // wheel rpm
  };
  ```

  Then we had to configure the sensors. ```cpp
  inline pros::ADIEncoder left_enc('A', 'B', false);
  inline pros::ADIEncoder back_enc('G', 'H', false);

  // left tracking wheel
  inline lemlib::TrackingWheel left_tracking_wheel(&left_enc, 2.75, 3);
  inline lemlib::TrackingWheel back_tracking_wheel(&back_enc, 2.75, -4);

  inline pros::Imu inertial_sensor(17);

  inline lemlib::OdomSensors_t sensors{
      &left_tracking_wheel,  // vertical tracking wheel 1
      nullptr,               // vertical tracking wheel 2
      &back_tracking_wheel,  // horizontal tracking wheel 1
      nullptr,               // horizontal tracking wheel 2
      &inertial_sensor       // inertial sensor
  };
  ```

  Then we had to set the constants for the PID #footnote("See glossary") loops.
  We'll cover what this means in more detail when we need to solve moving the
  robot during the autonomous period.

  ```cpp
  // forward/backward PID
  inline lemlib::ChassisController_t lateralController{
      8,    // kP
      30,   // kD
      1,    // smallErrorRange
      100,  // smallErrorTimeout
      3,    // largeErrorRange
      500,  // largeErrorTimeout
      5     // slew rate
  };

  // turning PID
  inline lemlib::ChassisController_t angularController{
      4,    // kP
      40,   // kD
      1,    // smallErrorRange
      100,  // smallErrorTimeout
      3,    // largeErrorRange
      500,  // largeErrorTimeout
      0     // slew rate
  };
  ```
  Once all of this was done we could combine it all together with the chassis
  constructor. ```cpp
  // create the chassis
  inline lemlib::Chassis chassis(drivetrain, lateralController, angularController,
                                 sensors);
  ```

  Now that the setup is complete all we have to do is call the chassis's calibrate
  method and we're good to go. ```cpp
  void initialize() {
    chassis.calibrate();
  }
  ``` Now we can get the chassis's current position at any time like this: ```cpp
  lemlib::Pose pose = chassis.getPose();
  printf("%f\n", pose.x);
  printf("%f\n", pose.y);
  printf("%f\n", pose.theta);
  ```
]

