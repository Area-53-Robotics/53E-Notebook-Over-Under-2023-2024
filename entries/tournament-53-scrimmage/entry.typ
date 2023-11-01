#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

// TODO: move to widgets

#let nb_tournament(matches: ((
  match: "",
  red_alliance: (teams: ("", ""), score: 0),
  blue_alliance: (teams: ("", ""), score: 0),
  won: false,
  auton: false,
  awp: false,
  notes: [],
),)) = {
  gridx(
    auto-lines: false,
    columns: (1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    [*Match*],
    [*Red Alliance*],
    [*Blue Alliance*],
    [*Auton Bonus*],
    [*AWP*],
    [*Notes*],
    //hlinex(stroke: (cap: "round", thickness: 2pt)),
    ..for match in matches {
      let color = if match.won { green.lighten(80%) } else { red.lighten(80%) }
      let cell = cellx.with(fill: color)

      let alliance_info(alliance: none) = {
        cell[
          #grid(
            columns: (1fr, 1fr),
            [
              #alliance.teams.at(0) \
              #alliance.teams.at(1) \
            ],
            [
              #set text(size: 15pt)
              #set align(horizon + center)
              #alliance.score
            ]
          )
        ]
      }

      let bool_icon(input) = {
        cell[
          #set align(horizon + center)
          #if input {image("/template/icons/check.svg", width: 1.5em)} else {image("/template/icons/x.svg", width: 1.5em)}
        ]
      }

      (
        cell[#match.match],
        alliance_info(alliance: match.red_alliance), 
        alliance_info(alliance: match.blue_alliance), 
        bool_icon(match.auton),
        bool_icon(match.awp),
        cell[#match.notes ],
      )
    },
  )
}

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
