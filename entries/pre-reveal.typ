#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *


#create_entry(
  title: "Pre Reveal Thoughts",
  type: "identify",
  start_date: datetime(year: 2023, month: 4, day: 26),
  [
    #nb_heading([Reflection on Last Season], level: 1)

    53E grew greatly as a team last season on both the building side and the programming side. We struggled a lot with getting a functional bot together, but in the end our bot was able to perform all of the tasks required for the Spin Up season. This difficulty was due to our inexperience and lack of planning. We did not plan our designs before building, we simply starting putting parts together. We did use CAD to a certain extent, but not to the point where we had a 1 to 1 mirror of our bot digitally. We would often be trying to get our bot functional even during tournaments. This meant we were constantly behind, and meant that our bot was not as tuned /* refined? fine tuned? efficient? */ as it could have been, and also meant that we did not have enough time for driver practice and autonomous testing.

    53E grew greatly as a team during the last season on both the building side and the programming side. We struggled to build a robot that could complete all of the tasks in the Spin Up season. This was mainly due to overall inexperience and lack of planning. While we did make an attempt to use CAD, we never really ended up with a 1 to 1 mirror of the robot digitally. More often than not, we would simply put parts together and seeing what would work, rather than planning it out beforehand. This lead to us being very behind, often building on our robot at tournaments. Despite these challenges we eventually built a fully functional robot and even made it to the state championship.

    Our programming also had mixed successes. One of our big achievements was working collaboratively. We were able to have two programmers working together on the same team working on the code at the same time. As far as we are aware, this is the first time in the club's history that this has worked. We did this using git and GitHub, which let us easily sync code across both programmer's computers. However we did not meet our major goal of implementing odometry in order to track our robot's position on the field during the autonomous period. Complex algorithms like odometry require a lot of testing in order to be effective, and we chose to prioritize getting a functioning robot over implementing it.

    // TODO: add footnotes for glossary (git, GitHub, CAD)

    #nb_heading([Goals], level: 1)

    #nb_heading([Team Management], level: 2)
    - Create and adhere to a schedule of when planning, building, programming, and testing should occur
    - Create a more organized team structure

    #nb_heading([Building], level: 2)
    - Create a more structured process for planning and testing work
    - Design everything system before building, using CAD software
    - Undergo more rigorous testing before tournaments

    #nb_heading([Programming], level: 2)

    - Implement odometry
    - Program an autonomous routine that can cross the field with minimal error buildup.

    Overall we are much better prepared for this season than we were the last. Our team is much more capable, not just in the realm of design and building, but also in our ability to write powerful and reliable software.

  ],
)
