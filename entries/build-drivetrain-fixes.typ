#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Build: Drivetrain Fixes",
  type: "build",
  start_date: datetime(year: 2023, month: 8, day: 5),
  end_date: datetime(year: 2023, month: 8, day: 9),
)[

  After testing our drivetrain and discovering several issues with it, we began to
  fix them.

  #grid(
    columns: (1fr, 2fr),
    gutter: 20pt,
    [
      The first issue we fixed was structural. We noticed that the spacers used as
      boxing for the C-channel were not snug, and were able to spin freely. This meant
      that they weren't taking load, and were effectively useless. We fixed this by
      finding the correct spacer configuration, which was added up to 0.875". We then
      replaced the existing spacers with white nylon ones.
    ],
    image("../assets/drivetrain/boxing.jpg"),
  )

  #grid(
    columns: (2fr, 1fr),
    gutter: 20pt,
    image("../assets/drivetrain/new-bracing.jpg"),
    [

      The second issue was also structural. The ends of the C-Channel on our
      drivetrain were only held together by a 1.5" standoff and a 0.375" nylon spacer.
      We decided to double this in order to increase the squareness of the drive.],
  )

  #grid(
    columns: (1fr, 2fr),
    gutter: 20pt,
    [
      The third issue had to do with the motor inserts coming out while driving. Our
      old configuration involved just a single motor insert, but the space between the
      motor cartridge and the C-channel is too large, and therefore allows the insert
      to come out, disengaging the motor from the axle.

      We solved this problem by adding an extra 1/16" spacer between the insert and
      the C-channel, and that solved the issue.
    ],
    image("../assets/drivetrain/motor-spacing-fix.svg"),
  )

  #grid(
    columns: (1fr, 2fr),
    gutter: 20pt,
    [
      We then addressed the issue of how difficult it was to control the drivetrain.
      We decided to substitute the omni wheels in the middle of the drivetrain with
      traction wheels in order to stop us from drifting.
    ],
    image("../assets/drivetrain/build-log/traction-wheel.jpg"),
  )

  #grid(
    columns: (1fr, 2fr),
    gutter: 20pt,
    [
      The next issue had to do with the friction on the drivetrain. During testing we
      noticed that both sides of the drivetrain were drawing much more than the
      recommended 1W of power. We combed over the drivetrain looking for places where
      friction could be an issue and made the following changes:
      - Reduced spacing on some axles
      - Straightened motor mounts
      - Corrected axle length

      The most egregious issue we found was a piece of C-channel that a motor was
      mounted to. It's holes had been worn away, and were no longer square. This
      caused the motor that was mounted to it to not be straight.
    ],
    image("../assets/drivetrain/build-log/holes.png"),
  )

  // TODO:
  // - discuss power draw fixes
  // - discuss friction fixes
  // - traction wheels

]

