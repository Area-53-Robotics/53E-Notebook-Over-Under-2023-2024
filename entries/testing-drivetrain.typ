#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Testing: Drivetrain",
  type: "test",
  start_date: datetime(year: 2023, month: 8, day: 4),
  [
  #nb_heading([Testing Procedure], level: 1)

  #nb_heading([Temperature and Current Draw], level: 2)
  1. Load the following code onto the robot's brain:
  ```cpp
    #include <iostream>
    void opcontrol() {
      pros::Motor_Group left_motors({1, 2, 3});
      pros::Motor_Group right_motors({-11, -12, -13});

      while (true) {
        // Move the motors at maximum speed
        left_motors.move(127);
        right_motors.move(127);

        int left_motor_draw = left_motors.get_current_draws();
        int right_motor_draw = right_motors.get_current_draws();

        int left_motor_temps = left_motors.get_temperatures();
        int right_motor_temps = right_motors.get_temperatures();

        // Print data to stdout in csv format
        printf("%f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f, %f,",
               left_motors_draw[0], left_motors_draw[1], left_motors_draw[2],
               right_motors_draw[0], right_motors_draw[1], right_motors_draw[2],
               left_motor_temps[0], left_motor_temps[1], left_motor_temps[2],
               right_motor_temps[0], right_motor_temps[1], right_motor_temps[2]);
      }
    }
    ```
  2. Make sure that the motors are not above room temperature
  3. Hold the robot in the air so the wheels don't touch the ground
  4. Run the code
  5. Log the results of the program to a csv file with the pros terminal:
  ```sh
    pros terminal --output log.csv
    ```
  6. Graph the results with this python script:
  ```py
    import pandas as pd
    import matplotlib.pyplot as plt

    headers = ["left_0_draw", "left_1_draw", "left_2_draw", "right_0_draw", "right_1_draw", "right_2_draw", "left_0_temp", "left_1_temp", "left_2_temp", "right_0_temp", "right_1_temp", "right_2_temp"]

    file = pd.read_csv("log.csv", delimiter=",", names=headers)

    y = []
    index = 0
    for line in file.left_0_draw:
      y.append(index)
      index += 1


    # Repeat for right draw, left temp, and right temp
    plt.plot(y, file["left_0_draw"], "y", file["left_1_draw"], "r", file["left_2_draw"], "g")

    plt.show()
    ```
  #nb_heading(
    [Crossing the Barrier and Stress Testing],
    level: 2,
  )
  1. Place the robot in front of the blue goal so that the back of the robot is against the edge of the goal. Center the robot to the middle of the goal.
  2. Have a driver move the robot forward, across the barrier, until the front of the robot is against the front of the red goal.
  3. Record whether the robot was able to cross the barrier, and the time it took to get from goal to goal.

  #nb_heading([Results], level: 1)

  ],
) 
