#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Build: Moving Triballs",
  type: "build",
  start_date: datetime(year: 2023, month: 9, day: 6),
)[
// Original text from John:
//The c-channel for the towers was cut, and most of the boxing was added. The mount points made of U-Channel were cut and assembled. The boxing in the drive train’s support towers was added.

#grid(
columns: (1fr, 2fr),
gutter: 20pt,
[
Today we worked on the base structure of the catapult.

1. We cut 2 lengths of C-channel down to 8 holes long. To serve as the side towers of the catapult.
2. We screwed the bearings and motor cap to the towers.
3. We added the standoffs to the inside of the catapult as boxing. 
4. We cut 1 hole long mounts out of U-channel that would connect the catapult towers to the drivetrain.
5. We mounted the towers to the drivetrain.

Next meeting we'll work on the bracing on the side in order to stop the towers from bending.

],
image("./towers.jpg")
)

]

#create_entry(
  title: "Build: Moving Triballs",
  type: "build",
  start_date: datetime(year: 2023, month: 9, day: 7),
)[

// Original John text:
//The towers were completed and it was found that part of the bracing for the towers intersected with parts of the drive train. This was remedied by only using half of the bracing, which did not affect structural stability severely.

#grid(
columns: (1fr, 2fr),
gutter: 20pt,
[
Today we worked on the triangle bracing on the sides of the towers.

1. We assembled 4 lengths of standoffs and spacers, each one comprised of a 1" standoff, a 1.5" standoff, and a 1/2" spacer.
2. We attached shaft collars to the end of the standoffs.
3. We screwed pillow bearings to the drivetrain and the top of the towers. 
#nb_admonition(type: "warning")[
We discovered that one of the standoffs on each side interfered with the gears in the drivetrain. We solved this by removing one standoff bracing from each side, bringing us down to 2.
]
4. We screwed the shaft collars into the pillow bearings, completing the bracing.

],
image("./bracing-clearance.jpg")
)

]



#create_entry(
  title: "Build: Moving Triballs",
  type: "build",
  start_date: datetime(year: 2023, month: 9, day: 8),
)[
// Original text from John:
// The throwing arm was completed with the exception of the side bracing. The spacing for the throwing arm’s axle was also completed.

#grid(
columns: (1fr, 1fr),
gutter: 20pt,

[
This meeting we worked on the throwing arm of the catapult. This is the part of the catapult that will actually move up and down and is what holds the triballs.

1. We cut two pieces of half cut down to 19 holes.
2. We drilled out the holes two from the end so that the high strength axle could fit through them.
4. We cut two pieces of half cut down to 8 holes to act as boxing for the base of the arm.
5. We screwed the 8 hole pieces of half cut together with the 19 hole pieces to complete the boxing.
6. We screwed the High strength 36 tooth gears to the boxing on the half cut.
7. We ran the axle through the middle of the gears and the towers on the catapult. We also placed spacers on the axle to make sure everything maintained the correct spacing.
8. We cut a piece of C-channel down to 13 holes.
9. We screwed the C-channel into the half cut, securing them together.

#nb_admonition(type: "warning")[
  While figuring out the spacing for the axle we realized that the CAD was incorrect. We ended up having to figure out the spacing by hand.
]
Next meeting we will finish the arm of the catapult and hopefully begin testing.
],
image("./incomplete-arm.jpg")
)
]


#create_entry(
  title: "Build: Moving Triballs",
  type: "build",
  start_date: datetime(year: 2023, month: 9, day: 9),
)[

#grid(
columns: (1fr, 2fr),
gutter: 20pt,
[
//The throwing arm was completed, and the driven gear’s spacing was completed.

The meeting we completed the arm of the catapult.

1. We cut a piece of half cut down to 13 holes.
2. We screwed the piece of half cut to the end of the catapult arm.
3. We attached 90 #sym.degree gussets to the end of the catapult to provide more bracing
#nb_admonition(type: "note")[
  This is a deviation from the CAD, we originally used two pieces of strip here. The 90 #sym.degree gussets provide much more rigidity and are a much better choice here.
]
4. We screwed standoffs to the end of the catapult.
5. We screwed standoffs to the top bar on the towers to act as a point for the rubber bands to be mounted.

],
image("./complete-arm.jpg"),

)
]

#create_entry(
  title: "Test: Moving Triballs",
  type: "test",
  start_date: datetime(year: 2023, month: 9, day: 15),
)[

#nb_heading([Testing Procedure], level: 1)

#nb_heading([General Testing], level: 2)

#image("./general-testing-cycle.svg", width: 60%)

#nb_heading([Trajectory Testing], level: 2)

#image("./trajectory-testing.svg", width: 55%)

#nb_heading([Results], level: 1)

#grid(
columns: (1fr, 1fr),
gutter: 20pt,
[

It was found upon initial testing that the driven axle bent when the catapult was pulled back. This meant that the bottom 12 tooth gears would disengage and begin to slip.

To remedy this, zip ties were used to brace the axle. This almost worked, but it put too much stress on the bottom axle, heavily increasing friction and it still didn't prevent all of the skipping. We decided to switch to a high strength axle instead.

Different stops were tested, and an optimum trajectory was achieved. The slip gears were modified to reflect these changes.

#nb_admonition(type: "note")[
  For testing purposes we used 3D printed 12 tooth gears. This allowed us to make slip gears relatively risk free.
]

Our final slip gear had 5 teeth.

],

figure(
  image("./stop-and-bands-down.jpg"),
  caption: "Rubber bands and stops"
  )
)

// TODO: image of 3D printed gears.

]

#create_entry(
  title: "Build: Moving Triballs",
  type: "build",
  start_date: datetime(year: 2023, month: 9, day: 16),
)[
#grid(
columns: (1fr, 2fr),
gutter: 20pt,
[
Due to our findings from last meeting we replaced the bottom axle on the catapult (the one with the 12 tooth gears on it) with a high strength axle. This required us to drill out the holes in our supporting towers so that a high strength axle could fit. We also needed to change the type of spacers we were using to high strength ones.


  //The 3d printed slip-gear was replicated using a high strength 12 tooth gear.

After the testing from last week we knew the final number of teeth required for the slip gear. We cut down steel 12 tooth gears so that they had 5 teeth instead and replaced the 3D printed ones.


],
figure(
  image("./new-axle.jpg"),
  caption: "The new axle and gear"
)
)

]

#create_entry(
  title: "Build: Moving Triballs",
  type: "build",
  start_date: datetime(year: 2023, month: 9, day: 22),
)[

#grid(
  columns: (1fr, 2fr),
  gutter: 20pt,
[
During testing we noticed that the motor on the catapult was not strong enough to hold the catapult arm in the down position. In order to fix this we decided to add a ratchet which will stop the catapult from being able to spin backwards.

 A ratchet was added to the catapult using plexiglass and a 24 tooth gear. The lexan was anchored to the side of the catapult with a flap protruding outwards. This flap meshed with the teeth of the 24 tooth gear in such a way that the gear could only move in one direction.

 The ratchet was then upgraded to use a larger gear (36 tooth) and a longer piece of lexan. The larger gear was designed to increase how precise the ratchet was to allow the catapult to be loaded at a lower angle. The longer lexan was designed to reduce the chance of the ratchet being over compressed and rotated to a point where it did not hold the catapult in place.

 ],

 image("./lexan-ratchet.svg", height: 75%)

 )
 #nb_admonition(type: "warning")[
   This solution ended up not working due to the ratchet consistently failing. The force of the rubber bands pulling on the catapult arm would pull bend the ratchet backward, disengaging it and rendering it useless.
 ]


// TODO: take picture of old ratchet (or add drawing)
]

#create_entry(
  title: "Build: Moving Triballs",
  type: "build",
  start_date: datetime(year: 2023, month: 9, day: 29),
)[

#grid(
columns: (1fr, 1fr),
gutter: 20pt,
[
This meeting we constructed the new ratchet.

1. We cut a 4 hole long piece of steel L-channel
2. We anchored it to the top of the catapult tower with a screw joint to allow it to rotate freely.
3. We attached a bearing to the L-channel to decrease the play of the screw joint.
#nb_admonition(type: "note")[
Another bearing was not needed on the anchoring piece of L-channel and would interfere with its anchoring screws.
]

Overall this ratchet is much stronger than our previous design and can hold the the catapult arm in place.

],
image("./new-ratchet.jpg")
)

//#nb_admonition(type: "build")[
  //The catapult is finally complete! The ratchet and limit switch 
//]

]
