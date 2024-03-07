#import "/packages.typ": notebookinator, codetastic
#import notebookinator: *
#import codetastic: qrcode
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Decide: Elevation",
  type: "decide",
  date: datetime(year: 2023, month: 11, day: 3),
  author: "Joy Oladimejij",
  witness: "Violet Ridge",
)

We needed a quick and easy elevation method that we could build in a single
meeting. We decided to build a design based off of 229V's Fall Reveal
#footnote[
  QR code to 229V's reveal video:
  #align(
    bottom,
    qrcode("https://www.youtube.com/watch?v=BGkmDeIMQyQ", size: 3pt),
  )
]
.

This design is completely passive, and attaches to a catapult, which we already
have. It consists of two arms that hook onto the elevation bar when the catapult
is in the up position.Each arm has a sled on the front of it to pull the robot
up when pushed against the bar.

#image("./design.svg")

All the driver will need to do is deactivate the catapult, and drive as fast as
possible into the elevation bar.
