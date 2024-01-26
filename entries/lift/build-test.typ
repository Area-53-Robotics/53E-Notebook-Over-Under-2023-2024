#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#create-body-entry(
  title: "Build: Lift",
  type: "build",
  date: datetime(year: 2024, month: 1, day: 6),
  author: "John Kelley",
  witness: "Alan Morales",
)[
  // Outline:
  // finish basic structure

  //The lifting lever (or arm) was completely built with the exception of custom
  //lexan hooks. Mount points for the arm and pneumatics were completely built. The
  //design was assembled completely. It was decided to rebuild the mount points to
  //increase structural stability.

  //The mount points for the arm were completely rebuilt. The mount points for the
  //pneumatics were partially built and assembled. It was decided that Alan would
  //finish building the mount points outside of practice.

  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    [
      Once we had the design for the lift nailed down, we began to build it.

      + We unmounted the old flywheel, as it was in the way of the lift. This required
        us to take out the 4 screws holding it in place, 2 on the piece of cross bracing
        on the front towers of the drivetrain (wedge side), and two attached to
        standoffs on the rear of the drive (intake side).
      + We Then built the base for the mount of the lift. This is a very similar design
        to the base of the catapult mount. It consists of a piece of U-channel that we
        attach to the front drivetrain towers.
      + We slotted the two pieces of 11 hole c-channel into those mount points to serve
        as the base for our lift.
      + We drilled holes in the c-channel with a 1/2" drill bit to make room for the
        high strength axle.
      + We built the body of the lift out of 20 hole c-channel and 17" hole half cut.
      + We added mount points for the piston towers in the same way that we did the lift
        towers.
      #admonition(
        type: "note",
      )[
        This ended up being much more difficult than we anticipated due to how deep into
        the drivetrain these mounts need to be placed.

      ]
      7. We then added the pistons to the piston towers, and attached them to the lift
        body.
      + We attached the flywheel to the lift body.

    ],
    [
      #figure(image("./1-side.png", width: 95%), caption: "Isometric view")
      #figure(image("./1-compressed.jpg", width: 95%), caption: "Side view")
    ],
  )
]

#create-body-entry(
  title: "Build: Lift",
  type: "build",
  date: datetime(year: 2024, month: 1, day: 12),
  author: "John Kelley",
  witness: "Felix Hass",
)[

  // Outline:
  // Remount flywheel

  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    [
      Open testing the lift, we noticed that the center of gravity was not quite where
      we needed it to be to get the robot to balance perfectly.
      #image("./center-of-gravity.svg")
      We considered a few options to solve this problem, including counterweights to
      the back of the robot, but eventually we settled on moving the entire lift 2
      holes forward. This would place the lift towers in the same place the catapult
      was, and the piston towers directly against the front (wedge side) drivetrain
      towers.

      Making this changed ended up being much harder than we thought it would be, and
      took the entire meeting to complete. Accessing the screws required to get the
      U-channel mount points into place was extremely difficult, and require removing
      much of the gears in the drivetrain. We were not able to complete this change,
      so we had to finish it next meeting.

    ],
    [
      #figure(image("./2-iso.jpg", width: 95%), caption: "Isometric view")
      #figure(image("./2-top.jpg", width: 95%), caption: "Top view")
    ],
  )

]

#create-body-entry(
  title: "Build: Lift",
  type: "build",
  date: datetime(year: 2024, month: 1, day: 13),
  author: "John Kelley",
  witness: "Felix Hass",
)[
  // Outline:
  // New hang assist design
  // Change lift mount point
  // Finish building

  #grid(
    columns: (1fr, 1fr),
    gutter: 20pt,
    [
      This meeting we finally got the lift mounted in the correct position. We also
      acquired some 3D printed decoration to put on our robot, supplied by one of our
      alumni.

      Once we had the lift in place we:
      + Remounted the flywheel to the lift with a more structurally sound piece of cross
        bracing.
      + Boxed the bracing on the flywheel to make sure it doesn't bend.
      + Mounted the pneumatic canisters right below the intake. This will help balance
        the weight of the robot, and keep them out of the way of the lift.
      + Added rubber bands running from the lift body to the drivetrain to assist the
        lift in pulling up the robot. We had to be careful in placing them, because we
        didn't want them to impede the elevation bar from entering the robot.
      #admonition(
        type: "build",
      )[
        The lift is finally complete! We look forward to the point advantage this will
        give us.
      ]
    ],
    [
      #figure(image("./3-top.jpg"), caption: "Top view")
      #figure(image("./3-side.jpg"), caption: "Side view")
    ],
  )

]
