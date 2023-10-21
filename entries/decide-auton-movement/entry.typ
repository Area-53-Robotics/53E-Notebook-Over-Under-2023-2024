#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Decide: Autonomous Movement",
  type: "decide",
  start_date: datetime(year: 2023, month: 8, day: 29),
)[

  We rated all of our choices by the following criteria:
  - Simplicity on a scale of 0 to 3. This is how simple the algorithm is to
    implement.
  - Accuracy on a scale of 0 to 3. This is how closely the algorithm can follow the
    intended path.
  - Robustness on a scale of 0 to 3. This is the amount of use cases that the
    algorithm covers.

  #nb_decision_matrix(
    properties: ("Simplicity", "Accuracy", "Robustness"),
    choices: (("Bang Bang", 3, 1, 1), ("PID", 2, 3, 3), ("Pure Pursuit", 1, 3, 2.5),),
  )

  #nb_admonition(
    type: "decision",
  )[
    We decided to use the PID controller for most of our movements, however we might
    still use Pure Pursuit for a few of them. This is mainly because they cover
    different use cases. Pure Pursuit would primarily be used for long movements
    that span the field, with a long complex path. PID is much better for shorter
    movements. Its likely that we'll only ever need PID, but we'll keep Pure Pursuit
    in mind.
  ]

  #nb_heading([Implementation], level: 1)

  LemLib provides a movement implementation using PID which already integrates
  with the Odometry it provides, so we'll use that.

  #nb_heading([PID], level: 2)

  The most important part of LemLib's moveToPoint algorithm is it's PID
  implementation. As mentioned before, PID is a closed loop controller, which
  means that it corrects for external forces. The output of the loop is calculated
  every 20 ms with the following equation:

  Assuming the following variables:
  - $P$ is the proportional term of the loop
  - $I$ is the integral term of the loop
  - $D$ is the derivative term of the loop
  - $K_p$ is the proportional constant
  - $K_i$ is the integral constant
  - $K_d$ is the derivative constant

  #nb_admonition(type: "equation")[

    $ P = K_p * e(t) $
    $ I = K_i * attach(#sym.integral, t: t, b: 0)e(tau)d tau $
    $ D = K_d * (d e(t)) / (d t) $

  ]

  Each term is added together to form the output. While the raw output of a
  controller is not suitable for moving a motor, the output can be tuned with the
  three constants. We will need to find the correct constants for our robot
  through trial and error.

  LemLib calculates PID output with the following code:

  ```cpp
  float lemlib::FAPID::update(float target, float position, bool log) {
      // calculate output
      float error = target - position; // Calculate P term
      float deltaError = error - prevError; // Calculate D term
      float output = kF * target + kP * error + kI * totalError + kD * deltaError;
      if (kA != 0) output = lemlib::slew(output, prevOutput, kA); // Limit rate of change, if applicable
      prevOutput = output;
      prevError = error;
      totalError += error; // Calculate I term

      return output;
  }
  ```

  The PID loop cannot run forever and needs an exit condition. We could naively
  assume that if error (distance from the target) is zero, then we exit, but this
  fails to account for overshooting. Instead, we say that the PID loop will exit
  after being within a certain acceptable error range for a certain amount of
  time.

  LemLib actually has two of these ranges, largeError and smallError respectively.
  LargeError has a larger time required and a larger acceptable range, while
  smallError has a smaller timeout and smaller acceptable range. There's also a
  global timeout which defines the maximum amount of time the robot is allowed to
  spend settling. The code for this is found below:

  ```cpp
  bool lemlib::FAPID::settled() {
      if (startTime == 0) { // if maxTime has not been set
          startTime = pros::c::millis();
          return false;
      } else { // check if the FAPID has settled
          if (pros::c::millis() - startTime > maxTime) return true; // maxTime has been exceeded
          if (std::fabs(prevError) < largeError) { // largeError within range
              if (!largeTimeCounter) largeTimeCounter = pros::c::millis(); // largeTimeCounter has not been set
              else if (pros::c::millis() - largeTimeCounter > largeTime) return true; // largeTime has been exceeded
          }
          if (std::fabs(prevError) < smallError) { // smallError within range
              if (!smallTimeCounter) smallTimeCounter = pros::c::millis(); // smallTimeCounter has not been set
              else if (pros::c::millis() - smallTimeCounter > smallTime) return true; // smallTime has been exceeded
          }
          // if none of the exit conditions have been met
          return false;
      }
  }
  ```

  LemLib uses two PID controllers to move the robot, one for linear movement, and
  one for angular movement. The output of the two is added together and then
  passed into the motor's `move()` method.

  ```cpp
  float angularPower = -angularPID.update(radToDeg(angularError), 0, log);
  float linearPower = linearPID.update(linearError, 0, log);

  float leftPower = linearPower + angularPower;
  float rightPower = linearPower - angularPower;

  // move the motors
  drivetrain.leftMotors->move(leftPower);
  drivetrain.rightMotors->move(rightPower);
  ```

  `AngularPower` and `LinearPower` are simply the output of the two PID loops.
  LemLib calculates the error with some simple trigonometry.

  ```cpp
  float lemlib::angleError(float angle1, float angle2, bool radians) {
      float max = radians ? 2 * M_PI : 360;
      float half = radians ? M_PI : 180;
      angle1 = fmod(angle1, max);
      angle2 = fmod(angle2, max);
      float error = angle1 - angle2;
      if (error > half) error -= max;
      else if (error < -half) error += max;
      return error;
  }

  float angularError = angleError(pose.angle(carrot), pose.theta, true); // angular error
  float linearError = pose.distance(carrot) * cos(angularError); // linear error
  ```

  `angularError`'s calculation is simple enough, but linearError is worth looking
  into. Instead of taking the raw distance, it multiplies by $cos("angularError")$ to
  find the distance that the robot can actually achieve while moving in a straight
  line.

  #image("./linear-error.svg", height: 25%)

  This will reduce linear error if the robot is not facing the target point,
  prioritizing angular movement.

  LemLib uses a boomerang controller in order to be able to move the robot to a
  specified rotation. It does this by following an intermediary carrot point.

  #nb_admonition(
    type: "equation",
  )[
    Assuming the following variables:
    - $d_"lead"$ is a constant set by us that dictates how far away the carrot point
      is from the end point.

    $ h = sqrt(x_"current" - x_"target" + y_"current" - y_"target") $
    $ x_"carrot" = x_"target" - h sin(theta_"target") * d_"lead" $
    $ y_"carrot" = y_"target" - h cos(theta_"target") * d_"lead" $
  ]

  As the robot gets closer to the carrot point, the carrot point gets closer to
  the target point, moving the robot along the projected path. Eventually the
  points will overlap, and the movement will be complete.

  #image("./boomerang-controller.svg")

]
