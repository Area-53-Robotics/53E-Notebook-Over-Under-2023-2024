#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Brainstorm: Wedges Rebuild",
  type: "brainstorm",
  date: datetime(year: 2023, month: 11, day: 29),
  author: "Violet Ridge",
  witness: "Meghana Noojipady",
)

After brainstorming we came up with several designs for full length wedges. All
three options involve some sort of plastic cover. Plastic is super easy to
manipulate into the right shape we want, making it the ideal surface for wedges.

= Options

#grid(
  columns: (2fr, 3fr),
  gutter: 20pt,
  [
    == Rebuild Wedge to use Plastic

    The wedge could be completely rebuilt to use plastic over supports.

    #pro-con(pros: [
      - Low complexity
      - Easy to tune
    ], cons: [
      - Hard to design
      - Hard to fabricate
    ])
  ],
  image("./complete-lexan.svg"),
  [
    == Add Plastic to Existing Wedges

    Plastic could be added between existing wedges to create a pushing surface.

    #pro-con(pros: [
      - Low complexity
      - Easy to fabricate
      - Easy to design
    ], cons: [
      - Hard to tune
    ])
  ],
  image("./lexan-over-old.svg"),
  [
    == Create Plastic Flap to Aid Existing Wedges
    A plastic flap could be used to aid the wedges without having to lift the bot.
    #pro-con(pros: [
      - Easy to fabricate
      - Easy to design
      - Easy to optimize
    ], cons: [
      - High complexity
    ])
  ],
  image("./flap-over-old.svg"),
)
