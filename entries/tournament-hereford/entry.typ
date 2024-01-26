#import "/packages.typ": notebookinator, diagraph
#import notebookinator: *
#import themes.radial.components: *

#import diagraph: *

#show: create-body-entry.with(
  title: "Tournament: Hereford Stampede",
  type: "test",
  date: datetime(year: 2023, month: 11, day: 28), // TODO: fix date
  author: "Meghana Noojipady",
  witness: "Felix Hass",
)

= Qualification Matches

#tournament((
  match: "Q5",
  red-alliance: (teams: ("7135E", "53E"), score: 57),
  blue-alliance: (teams: ("53C", "960W"), score: 49),
  won: true,
  auton: false,
  awp: false,
), (
  match: "Q13",
  red-alliance: (teams: ("5588H", "9290A"), score: 22),
  blue-alliance: (teams: ("53E", "5588B"), score: 70),
  won: true,
  auton: false,
  awp: false,
), (
  match: "Q28",
  red-alliance: (teams: ("53E", "960Z"), score: 59),
  blue-alliance: (teams: ("53D", "9080C"), score: 122),
  won: false,
  auton: false,
  awp: false,
), (
  match: "Q33",
  red-alliance: (teams: ("1893P", "929S"), score: 93),
  blue-alliance: (teams: ("53E", "82856A"), score: 139),
  won: true,
  auton: false,
  awp: false,
), (
  match: "Q44",
  red-alliance: (teams: ("53E", "5599T"), score: 106),
  blue-alliance: (teams: ("7135B", "9080S"), score: 86),
  won: true,
  auton: false,
  awp: false,
), (
  match: "Q60",
  red-alliance: (teams: ("1893C", "53E"), score: 170),
  blue-alliance: (teams: ("934Z", "929X"), score: 58),
  won: true,
  auton: false,
  awp: false,
))

= Alliance Selection

We were 10th place in eliminations, so we didn't have very many options. We
hoped that we could get a team above us to pick us. We talked to 1893C, 929N,
82856A. We thought that it was highly unlikely that 1893C would pick us, so we
hoped 929N or 82856A would.

If one of these teams doesn't pick us, we'll need to pick a team. We thought
that 1727R's bot would complement ours very well, so we reached out to them. We
also talked to 53C and 1727A.

#raw-render[```dot
  digraph {
    rankdir=LR;
    start->"929N picks us"
    "929N picks us"->"82856A picks us" [label = "no"]
    "929N picks us"->"end" [label = "yes"]
    "82856A picks us"->"We pick 1727R" [label = "no"]
    "82856A picks us"->"end" [label = "yes"]
    "We pick 1727R"->"We pick 53C" [label = "no"]
    "We pick 53C"-> end [label = "yes"]
    "We pick 53C"->"We pick 1727A" [label = "no"]
    "We pick 1727A"->end

    start[shape=Mdiamond]
    end[shape=Msquare]
  }
```]

The above flow chart represents our decision making plan. In the end, 1893C
partnered with 929N, and 82856A ended up picking us.

= Elimination Matches

#tournament((
  match: "R16 #8-1",
  red-alliance: (teams: ("82856A", "53E"), score: 196),
  blue-alliance: (teams: ("9290C", "929R"), score: 72),
  won: true,
  auton: false,
  awp: false,
), (
  match: "QF #4-1",
  red-alliance: (teams: ("5588E", "53A"), score: 89),
  blue-alliance: (teams: ("82856A", "53E"), score: 115),
  won: true,
  auton: false,
  awp: false,
), (
  match: "SF #2-1",
  red-alliance: (teams: ("1893C", "929N"), score: 71),
  blue-alliance: (teams: ("82856A", "53E"), score: 103),
  won: true,
  auton: false,
  awp: false,
), (
  match: "Final #1-1",
  red-alliance: (teams: ("1727B", "1727K"), score: 140),
  blue-alliance: (teams: ("1893C", "929N"), score: 120),
  won: false,
  auton: false,
  awp: false,
))

= Reflection

#grid(
  columns: (1fr, 1fr),
  // FIXME: port pie chart
  /*
nb-pie-chart(
  (8, green, "wins"),
  (2, red, "losses"),
),
*/
  [],
  [
    Overall we're extremely happy with the performance of our robot. We won nearly
    all of our qualification matches, and got all the way to finals.
  ],
)

Our overall robot performance was as follows:

#pro-con(
  pros: [
    - Flywheel was able to quickly and consistently fire the triballs across the field
    - Intake was able to quickly and consistently grab the triballs
  ],
  cons: [
    - Our robot could not elevate at all.
    - We cannot consistently get AWP.
  ],
)

Overall our focus in the coming meetings should be to improve our climbing
mechanism, and getting our auton as consistent as possible. The other parts of
our robot work extremely well and don't need to be changed.
