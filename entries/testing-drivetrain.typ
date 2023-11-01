#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Test: Drivetrain",
  type: "test",
  start_date: datetime(year: 2023, month: 8, day: 4),
  [
    #nb_heading([Testing Procedure], level: 1)

    #nb_heading([Temperature and Current Draw], level: 2)
    1. Load the following code onto the robot's brain:
    ```cpp
                int start_time = pros::millis();
                int end_time = start_time + 1000 * 60; // Run for 60 seconds

                while (pros::millis() < end_time) {
                  // Move the motors at maximum speed
                  if (!controller.get_digital(
                          pros::E_CONTROLLER_DIGITAL_A)) {  // Emergency stop
                    left_motors.move(127);
                    right_motors.move(127);
                  }

                  std::vector<std::int32_t> left_motor_draw =
                      left_motors.get_current_draw_all();
                  std::vector<std::int32_t> right_motor_draw =
                      right_motors.get_current_draw_all();

                  std::vector<double> left_motor_temps = left_motors.get_temperature_all();
                  std::vector<double> right_motor_temps = right_motors.get_temperature_all();

                  // Print data to stdout in csv format
                  printf("%i, %i, %i, %i, %i, %i, %f, %f, %f, %f, %f, %f, %i \n",
                         left_motor_draw[0], left_motor_draw[1], left_motor_draw[2],
                         right_motor_draw[0], right_motor_draw[1], right_motor_draw[2],
                         left_motor_temps[0], left_motor_temps[1], left_motor_temps[2],
                         right_motor_temps[0], right_motor_temps[1], right_motor_temps[2],
                         pros::millis());
                pros::delay(10);  // The brain terminal cannot handle faster than this
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
    #nb_heading([Speed Testing], level: 2)
    1. Mark two pieces of painter's tape on the floor 12 feet apart.
    2. Place the robot so that the front of the drivetrain is against the edge of the
      tape.
    3. Have another teammate ready with a camera, and record the next step.
    4. Drive the drivetrain as fast as possible forwards until the front of the
      drivetrain touches the other tape.
    5. Play back the video, and find the time that it took to traverse the distance

    #nb_heading([Results], level: 1)

    #nb_heading([Temperature and Current Draw], level: 2)

    Overall the power draw held very steady for both sides, but this is expected
    since the wheels were free spinning.

    #grid(
      columns: (1fr, 2fr),
      gutter: 20pt,
      [
        #nb_heading([Left Motors Power ], level: 3)
        The left motors power draw is very distributed. The 3rd motor is using a lot of
        power, staying around 2W. The 2nd motor operates at around the expected wattage,
        at about 1W, and the first motor uses almost no power at all.

      ],
      image("../assets/drivetrain/tests/power-left.png"),
      [
        #nb_heading([Right Motors Power Draw], level: 3)
        The right side motors are much less distributed. The 1st and 2nd motors use
        under 1W, but the third motor uses around 1.35W.
      ],
      image("../assets/drivetrain/tests/power-right.png"),
      [
        #nb_heading([Left Motors Temperature], level: 3)
        #nb_admonition(
          type: "warning",
        )[
          The temperature sensors on the V5 motors only output the temperature in steps of
          5$degree.c$.
        ]
        Due to the short length of the test and the low accuracy of the temperature
        sensors the results of this test are almost completely useless. After about 30
        seconds the 3rd motor increases from 35$degree.c$ to 40$degree.c$, and that the
        1st and 2nd motors stay stagnant at 40$degree.c$. We can see that about 30
        seconds in the temperature changes by 5$degree.c$. We can conclude that the
        decreased temperature of the 3rd motor is due to its low power draw but it's
        likely that if we want to get meaningful data from this we will need to test
        over a much larger period of time.
      ],
      image("../assets/drivetrain/tests/temperature-left.png"),
      [
        #nb_heading([Right Motors Temperature], level: 3)
        This test fared similarly to the left side motors. The 1st motors stayed
        stagnant at 40$degree.c$. The 2nd and 3rd motors started at 35$degree.c$ and
        increased to 40$degree.c$ over time, the 2nd motor after 10s and the 3rd motor
        after 30.
      ],
      image("../assets/drivetrain/tests/temperature-right.png"),
    )
    #pagebreak()

    #nb_heading([Speed Testing], level: 2)
    We conducted a total of 5 trials of our speed test.

    #nb_admonition(
      type: "note",
    )[
      The video we took of the 1st trial started late, and therefore did not have
      enough info to calculate the correct time.
    ]
    #nb_table(
      columns: 7,
      [],
      [Trial 1],
      [Trial 2],
      [Trial 3],
      [Trial 4],
      [Trial 5],
      [Average],
      [Time],
      [n/a],
      [2.08s],
      [2.08s],
      [2.08s],
      [2.04s],
      [2.07s],
      [Speed],
      [n/a],
      [5.76 f/s],
      [5.76 f/s],
      [5.76 f/s],
      [5.88s f/s],
      [5.76 f/s],
    )

    We also recorded the velocity of the left and right side of the drivetrain
    during each test.

    #let graph_width = 75%

    #figure(
      caption: [ Trial 1 ],
      image("../assets/drivetrain/tests/test-1.png", width: graph_width),
    )
    #figure(
      caption: [ Trial 2 ],
      image("../assets/drivetrain/tests/test-2.png", width: graph_width),
    )
    #figure(
      caption: [ Trial 3 ],
      image("../assets/drivetrain/tests/test-3.png", width: graph_width),
    )
    #figure(
      caption: [ Trial 4 ],
      image("../assets/drivetrain/tests/test-4.png", width: graph_width),
    )
    #figure(
      caption: [ Trial 5 ],
      image("../assets/drivetrain/tests/test-5.png", width: graph_width),
    )

    #pagebreak()

    #nb_heading([Final Conclusion], level: 1)

    The drivetrain matches our projected speed of 5.96 f/s pretty closely with an
    average speed of 5.76 f/s. It is also much faster than our drivetrain from last
    year, properly taking advantage of all 6 motors.

    However there are a couple issues that need fixing:
    - Several motors use more than the recommended 1W in free spin.
    - While testing speed we noticed that the drivetrain doesn't move in a straight
      line, so one side is moving slower than the other
    - While doing informal tests on our practice field we noticed that the bot cannot
      get over the barrier.
    - The drivetrain is very difficult to control overall due our use of 6 omni
      wheels. Making turns is exceptionally difficult, especially sharp ones. The
      drivetrain continues in its original direction for a good distance, with no way
      to control it.

  ],
)
