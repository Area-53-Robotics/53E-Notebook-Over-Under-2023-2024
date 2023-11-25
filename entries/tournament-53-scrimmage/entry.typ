#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

// TODO: move to widgets



#create_entry(
  title: "Tournament: Area 53 Scrimmage",
  type: "test",
  start_date: datetime(year: 2023, month: 10, day: 21),
)[
  #grid(
    columns: (1fr,1fr),
    gutter: 20pt,
    [
      We ran a mock tournament to test out our robots today. This included 6 qualification matches, eliminations, and even judging.

      #nb_heading[Robot Performance]

      Our robot performed pretty well. Our drivetrain never broke down, however we did have some issues.

      #nb_heading(level: 2)[Catapult]

      Our catapult was not strong enough to shoot over the barrier. This posed an issue as it meant we couldn't send triballs over the barrier to our alliance partner. Eventually we discovered that we could shoot over the elevation bar for a shorter distance over the barrier. Any excess triballs could then be pushed by the robot. 

      #nb_heading(level: 2)[Wings]

      The wings did their job great. The only issue was the rubber bands the pulled them back in getting snapped, leaving them open.

      #nb_heading(level: 2)[Wedges]

      The wedges were terrifyingly effective, giving us a large advantage whenever pushing other robots. They were helpless to stop us.


      #nb_heading[Practice Interview]

      Overall our interview went pretty well. We talked about all of the major subsystems on our robot. We did leave some points on the table thought, leaving out strategy, team management, and engineering design process. These can be pretty easily integrated into our existing planned interview, so we're on track.
    ],
    figure(
      image("./stuck.jpg"),
      caption: "Pushing match with 53A"
    )
  )


]
