#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Identify: Intake Rebuild",
  type: "identify",
  date: datetime(year: 2024, month: 2, day: 10), // TODO: fix date
)

At our past tournaments we began to see some problems with our intake. Poor
design was causing it to fall apart in several ways. The complete lack of
bracing meant that the c-channel was bending, the motor was exposed to the
outside of the robot, meaning it could easily be hit and disassembled by other
robots, and the stops weren't boxed at all, meaning they were twisting the
c-channel they were screwed into.

Our intake is our main method of scoring this late in the season, so its
extremely important that it be working as well as possible.

#image("./old-intake.png")

= Constraints

- We can only use 1 motor for this design.
- The design must also fit within the starting 18", and cannot expand further than
  36". This is particularly a challenge for the intake because we need it to stick
  out of the robot in order to grab the triballs easily.

= Goals

- Protect the motor powering the intake by placing it on the inside of the bot.
- Brace the intake to remove pressure from the axle.
- Make the intake wider to make possession easier.
- Be able to possess triballs at the same rate as the old intake.
