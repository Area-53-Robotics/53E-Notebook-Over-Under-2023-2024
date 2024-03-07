#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Pre Reveal Thoughts",
  type: "identify",
  date: datetime(year: 2023, month: 4, day: 26),
  author: "Felix Hass",
  witness: "Violet Ridge",
)

= Reflection on Last Season

53E grew greatly as a team during the last season on both the building side and
the programming side. We struggled to build a robot that could complete all of
the tasks in the Spin Up season. This was mainly due to overall inexperience and
lack of planning. While we did make an attempt to use CAD #footnote("See glossary")<nb_gl>,
we never really ended up with a 1 to 1 mirror of the robot digitally. More often
than not, we would simply put parts together and seeing what would work, rather
than planning it out beforehand. This lead to us being very behind, often
building on our robot at tournaments. Despite these challenges we eventually
built a fully functional robot and even made it to the state championship.

Our programming also had mixed successes. One of our big achievements was
working collaboratively. We were able to have two programmers working together
on the same team working on the code at the same time. As far as we are aware,
this is the first time in the club's history that this has worked. We did this
using git #footnote(<nb_gl>) and GitHub, #footnote(<nb_gl>) which let us easily
sync code across both programmer's computers. However we did not meet our major
goal of implementing odometry #footnote(<nb_gl>) in order to track our robot's
position on the field during the autonomous period. Complex algorithms like
odometry #footnote(<nb_gl>) require a lot of testing in order to be effective,
and we chose to prioritize getting a functioning robot over implementing it.

= Goals

== Team Management

- Create and adhere to a schedule of when planning, building, programming, and
  testing should occur
- Create a more organized team structure

== Building

- Create a more structured process for planning and testing work
- Design everything system before building, using CAD software
- Undergo more rigorous testing before tournaments

== Programming

- Implement odometry
- Program an autonomous routine that can cross the field with minimal error
  buildup.

Overall we are much better prepared for this season than we were the last. Our
team is much more capable, not just in the realm of design and building, but
also in our ability to write powerful and reliable software.
