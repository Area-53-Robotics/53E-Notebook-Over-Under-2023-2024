#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Build: Drivetrain",
  type: "build",
  start_date: datetime(year: 2023, month: 7, day: 14),
  end_date: datetime(year: 2023, month: 7, day: 28),
  [
    Once we completed our CAD design of our robot, we were able to begin building
    it. Due to most of our team being on vacation at this time, Alan was the only
    one building on the drivetrain. This made progress slower than it should have
    been.

    #grid(
      columns: (1fr, 1fr),
      gutter: 20pt,
      [
        #nb_heading([2023/07/14], level: 1)
        1. Cut full length C-channel down to 30 holes in order to make the long bars on the
          side.
        2. Added the bearings to the C-channel
        3. Cut 5 hole long C-channel for the motor and gear mounts
        4. Mounted the 5 hole C-channel to the 30 hole C-channel.
      ],
      image("/assets/drivetrain/build-log/1.jpg"),
      image("/assets/drivetrain/build-log/2.jpg"),
      [
        #nb_heading([2023/07/15], level: 1)
        1. Cut the rest of the 5 long C-channels
        2. Mounted and braced them to the 30 long C-channels
      ],
      [
        #nb_heading([2023/07/21], level: 1)
        1. Cut 3 30 long C-channels to serve as the perpendicular braces
        2. Mounted the 30 long C-channels to the other 30 long C-channels from before
        #nb_admonition(
          type: "note",
          [
            We did not have the required 84 tooth gears and 4" omni wheels required to
            finish the drivetrain, so we'll have to wait till they arrive.
          ],
        )
      ],
      image("/assets/drivetrain/build-log/3.jpg"),
      image("/assets/drivetrain/build-log/4.jpg"),
      [
        #nb_heading([2023/07/22], level: 1)
        1. Mounted gears to frame
        2. Mounted wheels to drivetrain
        3. Filled axles with the correct amount of spacers
        4. Added mount points for quick swap motors

        #nb_admonition(
          type: "note",
          [
            We did not have the required 48 tooth gears to be able to finish the drivetrain,
            so we'll have to wait till next meeting to for them to arrive.
          ],
        )

      ],
      [
        #nb_heading([2023/07/29])
        1. Mounted remaining gears
        2. Mounted remaining motors
        3. Mounted battery, brain, and radio to temporary locations.

        #nb_admonition(
          type: "build",
        )[
          The drivetrain is finally completed, meaning that we can now move on to testing.
        ]

      ],
      image("/assets/drivetrain/build-log/5.jpg"),
    )

  ],
)
