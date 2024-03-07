#import "/packages.typ": notebookinator, diagraph
#import notebookinator: *
#import themes.radial.components: *
#import "/utils.typ": tournament-from-csv

#import diagraph: *

#show: create-body-entry.with(
  title: "Tournament: Blakefield Robotics Challenge",
  type: "test",
  date: datetime(year: 2024, month: 1, day: 27), 
  author: "Meghana Noojipady",
  witness: "Felix Hass",
)

= Qualifications

#let qual-data = tournament-from-csv(
  read("./RE-VRC-23-1581-Division 1-Results-2024-02-13.csv"),
  team-name: "53E",
  section: "qualifications",
)
#(qual-data.at(0).auton = true)
#(qual-data.at(1).auton = true)
#(qual-data.at(2).auton = true)
#(qual-data.at(3).auton = true)
#(qual-data.at(4).auton = true)

#tournament(..qual-data)

= Alliance Selection

We were in 13th place in eliminations so we planned on choosing our alliance
partner. Our two top choices were 9080C and 53C, which was a tough choice to
call.

#raw-render[```dot
  digraph {
    rankdir=LR;
    start->"We pick 9080C"
    "We pick 9080C"->"We pick 53C" [label = "no"]
    "We pick 9080C"->"end" [label = "yes"]
    "We pick 53C" ->"end"[label = "yes"]

    start[shape=Mdiamond]
    end[shape=Msquare]
  }
```]

We had contemplated picking 53C to bring them up and possibly qualify them for
states but ultimately we went with 9080C who had a bot very compatible to ours
and had us as their number one option too.

= Eliminations

#let elims-data = tournament-from-csv(
  read("./RE-VRC-23-1581-Division 1-Results-2024-02-13.csv"),
  team-name: "53E",
  section: "eliminations",
)

#tournament(..elims-data)

= Reflection

#grid(
  columns: (1fr, 1fr),
  pie-chart(
    (value: 6, color: green, name: "wins"),
    (value: 2, color: red, name: "losses"),
  ),
  [
    Overall we're extremely happy with the performance of our robot. We won nearly
    all of our qualification matches, and got all the way to semifinals.
  ],
)

Our overall robot performance was as follows:

#pro-con(
  pros: [
    - Autonomous worked very well in most of our matches and we were able to learn
      more about winpoint importance.
    - Hang mechanism worked well and lifted our bot sturdily!
  ],
  cons: [
    - Our robot could not elevate if the pistons ran out of air.
    - The intake of our robot was extremely janky and needed to be braced properly.
    - We only had three team members present, so we were forced to rush several times
      and be aware of what was going on.
  ],
)

Overall, our robot needed several improvements, the most important being the
hang mechanism and supplying it with enough air to be able to retract it down
and up multiple times, which it previously wasn't able to do. Another
improvement we wanted to add was a stable intake as well as stronger intake
banding.
