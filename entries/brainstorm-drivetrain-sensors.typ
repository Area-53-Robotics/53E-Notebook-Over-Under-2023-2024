#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Brainstorm: Drivetrain Sensors",
  type: "brainstorm",
  start_date: datetime(year: 2023, month: 7, day: 28),
  [
  In order to be able to track our robot with odometry #footnote(<nb_gl>) we need sensors. Odometry requires our sensors to be able to do three things:
  - track our movement forwards and backwards
  - track our movement side to side
  - track our rotation

  #nb_admonition(
    type: "note",
    [
    Tracking side to side movement is not required unless the robot can strafe, but it helps majorly reduce error over time, so we've decided we want it.
    ],
  )

  We came up with three configurations of sensors that would give us odometry capabilities:

  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    [
    #nb_heading([GPS Sensor], level: 1)
    This configuration uses a single GPS sensor to find our position on the field. This sensor works by finding a pattern similar to a QR code on the edge of the field.
    #nb_pro_con(
      pros: [
      - Only needs 1 sensor
      - Doesn't take up much room
      ],
      cons: [
      - Very noisy
      - Very expensive
      - Not all fields support it
      ],
    )
    ],
    image("/assets/drivetrain/sensor-configs/gps.svg"),
    [
    #nb_heading([Three Tracking Wheels], level: 1)
    This configuration involved three passive wheels, attached to optical shaft encoders. 2 of the wheels are in parallel to each other, and 1 wheel is perpendicular to the two parallel ones. The parallel wheels track forwards and backwards movement, and can also calculate rotation based on their offset from each other. The perpendicular wheel tracks side to side movement.

    #nb_admonition(
      type: "note",
      [
      VEX offers two types of sensors that track rotational movement: the V5 rotation sensor, and the V4 optical shaft encoder. However the V5 sensors are much more expensive, and the V4 sensors are 4 times more accurate due to their larger encoder disc, so we did not consider using the V5 sensors.
      ],
    )

    #nb_pro_con(
      pros: [
      - Very accurate
      - Doesn't drift easily
      ],
      cons: [
      - Takes up a lot of room
      ],
    )
    ],
    figure(
      caption: "The wheels can be positioned anywhere on the orange lines without adjusting distances in the code.",
      image("/assets/drivetrain/sensor-configs/3-tracking-wheels.svg"),
    ),
    [
    #nb_heading([Two Tracking Wheels and IMU], level: 1)
    This configuration uses two passive tracking wheels, and 1 IMU (inertial sensor) to track rotation. This setup is identical to the previous one, except the IMU replaces one of the parallel tracking wheels.
    #nb_pro_con(
      pros: [
      - Takes up less space
      - Very accurate
      ],
      cons: [
      - The IMU can drift
      ],
    )

    ],
    image("/assets/drivetrain/sensor-configs/2-tracking-wheel-imu.svg"),
    [
    #nb_heading([Integrated Motor Encoders], level: 1)
    This configuration uses the integrated motor encoders as a replacement to tracking wheels.

    #nb_admonition(
      type: "warning",
      [Our drivetrain does not have a perpendicular motor, so this configuration does not support tracking side to side.],
    )

    #nb_pro_con(
      pros: [
      - Does not need any addition sensors
      ],
      cons: [
      - No side to side tracking
      - Motor encoders are much less accurate than tracking wheels
      - Has to compensate for slop in gears, unless directly driven
      ],
    )
    ],
    image("/assets/drivetrain/sensor-configs/ime.svg"),
  )

  ],
)

