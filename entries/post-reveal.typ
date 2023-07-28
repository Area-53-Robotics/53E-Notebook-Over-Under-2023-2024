#import "/template/entries.typ": *

#create_entry(
  title: "Post Reveal Thoughts",
  type: "brainstorm",
  start_date: datetime(year: 2023, month: 4, day: 27),
  [
    // TODO: clarify process

    After the game reveal each member of the team wrote down their thoughts on what the coming season will look like, and ideas for our robot. \

    \
    #nb_admonition(
      type: "note",
      [
        These were recorded before the rules were released, so they are made without key information, like expansion limits, or how the autonomous win point will be scored.
      ],
    )

    #nb_heading([Felix], level: 1)

    #nb_heading([Scoring Mechanisms], level: 2)
    My first thought for a mechanism to move the triballs is something similar to the bots we see for FRC's Charged Up. A long arm with flex wheels that spin to grab the triballs. The climbing mechanism is much more difficult. The real question is whether we use the same mechanism as the triball collector for this, and whether that's feasible to build. The hardest part to me seems like getting a consistent hold on the PVC pipe. It is very inconvenient that the pole is vertical, which will make it very hard to maintain a grip.

    #nb_heading([Drivetrain], level: 2)
    Our drivetrain is the core of our robot, and is easily the most important part to get right. Due to the lack of heavy objects, torque is much less important than speed. We can use a similar gear ratio to our robot during the Spin Up Season, or maybe even higher. The real question is whether we can get a six motor drive. If we can get the triball grabbing and bot lifting on two motors that would be amazing, but I'm not sure if it's possible.

    The weight of the drive (and the bot overall) is also very important. If we were considering a steel drivetrain before, we certainly should not be now. We need to be as light as possible to make lifting our robot as easy as possible.

    The ability of our bot to cross the middle line is also very important due to the ramification of having a bot of our alliance on our side of the field. If we can quickly switch sides, it will mean that we can quickly shut down our opponents defense without even interacting with their robot.

    #nb_heading([Programming], level: 2)
    As always, consistent chassis movement is the key to a perfect auton. Using an absolute positioning system like GPS or Odometry can make this much easier, because it allows the robot to correct for past error, or even external interference. There are also many different motion control algorithms we can use, like PID and/or motion profiling. Overall, tracking wheels and an IMU will be a must, but these sensors might have some difficulty when we cross the center line, due to the bot leaving the ground. In addition, if our robot is high off the ground, we may have some trouble getting the tracking wheels to touch the ground.

    #nb_heading([John], level: 1)
    I think that the best intake for this season would easily be one with horizontal flex wheels. This would allow the bot to reach under the goal easier and also could be easier to build. We will most definitely need a shooting mechanism (a catapult would work best, and we have more experience with such building). We will also need some sort of scissor lift to lift the bot. All of these systems will require a motor, so we will need a four motor drive. This means that we can spare a motor on the claw for lifting the bot. We will want a fast drive with the center locked omni.

    #nb_heading([Alan], level: 1)
    At first I was very surprised by this game as it seemed that the results of a match would be decided in the first few seconds. However, upon further review I noticed the heavily weighted importance on match loads (22 match loads with only 12 game pieces on the field). This makes an intake that is able to get match loads necessary. I also began thinking of ways to climb the pole, as that makes up a big amount of points. My initial idea is a claw with two flex wheels on the inside, so the claw could clamp on to the pole and the wheels could rotate and drag the robot upwards. A lot of torque will be necessary but it may be doable.

    #nb_heading([Meghana], level: 1)

    #nb_admonition(
      type: "note",
      [
        Meghana joined the team after the season started, so her thoughts may be influenced by the ideas of other teammates.
      ],
    )

    After watching the video, I believe that we could create a strong claw mechanism which can grip the pole firmly, as it gets the most amount of points. It should be able to hold the weight as well. For the robots, they should be faster in speed but have flexible and firm wheels which can improve the accuracy of movements. Autonomous points and the winner of the autonomous period is a large head start in the game and would also be helped by the wheels and speed.

  ],
)
