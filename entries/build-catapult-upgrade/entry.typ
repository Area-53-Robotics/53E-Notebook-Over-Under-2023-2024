#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Build: Catapult Upgrade",
  type: "build",
  date: datetime(year: 2023, month: 10, day: 31),
  author: "Felix Hass",
  witness: "Alan Morales",
)

#grid(
  columns: (2fr, 1fr),
  gutter: 20pt,
  [
    After the scrimmage it was evident that our catapult needed some upgrades. The
    most pressing issue was the lack of power. The catapult couldn't shoot over the
    barrier, making it almost useless. We couldn't add more rubber bands due to the
    motor running out of torque, so we'll need to find another solution.

    #heading[Longer Arm]

    The following equations show that the velocity of an object rotating around a
    fixed point is directly proportional to the radius of the movement, and that
    kinetic energy is greatly increased by by velocity.

    #admonition(type: "equation")[
      $ v = r #sym.omega $
      $ E_k = 1/2 m v^2 $
    ]

    This means that we can improve the catapult's output simply by making the arm
    longer.

    #heading[Rotation Sensor]

    We noticed that the limit switch we were using didn't work very well. It didn't
    get consistently pressed, and had to be bent to get into the correct position.
    In addition, the catapult has no concept of how far away it is from the targeted
    position.

    We replaced the limit switch with a rotation sensor. This sensor is not only
    more accurate, but it also doesn't forget the position of the catapult when the
    program is turned off.

    #heading[New Ratchet]

    With the rotation sensor replacing the old ratchet, we needed to reposition it.
    We used a design inspired from one of 7686B's Spin Up robots #footnote(link("https://www.youtube.com/watch?v=giECYNrFSWM")).
    This design consists of a pillow bearing interfacing with a gear below.

  ],
  [
    #figure(image("./iso.jpg", width: 75%), caption: "Lengthened arm")
    #figure(image("./sensor.jpg", width: 75%), caption: "New sensor")
    #figure(
      image("./ratchet.jpg", width: 75%),
      caption: "Ratchet, with temporary 3D printed gear",
    )
  ],
)
