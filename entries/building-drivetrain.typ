#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *


#create_entry(
  title: "Building the Drivetrain",
  type: "build",
  start_date: datetime(year: 2023, month: 7, day: 14),
  end_date: datetime(year: 2023, month: 7, day: 22),
  [
    #grid(
      columns: (1fr, 1fr),
      gutter: 5pt,
      [
        #nb_heading([2023/07/14], level: 1)
        1. Cut full length C-channel down to 30 holes in order to make the long bars on the side.
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
            We did not have the required 48 tooth gears to be able to finish the drivetrain, so we'll have to wait till next meeting to for them to arrive.
          ],
        )

      ],
    )


  ],
)
