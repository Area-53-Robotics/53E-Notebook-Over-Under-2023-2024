#import "/template/template.typ": *
#show:  create_entry.with(
  title: "Brainstorm: Wedges Rebuild",
  type: "brainstorm",
  start_date: datetime(year: 2023, month: 11, day: 28),
)

After brainstorming we came up with several designs for full length wedges. All three options involve some sort of plastic cover. Plastic is super easy to manipulate into the right shape we want, making it the ideal surface for wedges.

= Options

#grid(
  columns: (2fr, 3fr),
  gutter: 20pt,
  [
    == Rebuild Wedge to use Lexan

   The wedge could be completely rebuilt to use plastic over supports.

    #nb_pro_con(
      pros: [
        - Low complexity
        - Easy to tune
      ],
      cons: [
        - Hard to design
        - Hard to fabricate
      ],
      )
  ],
  image("./complete-lexan.svg"),

  [
    == Add Lexan to Existing Wedges

    Lexan could be added between existing wedges to create a pushing surface.

    #nb_pro_con(
      pros: [
        - Low complexity
        - Easy to fabricate
        - Easy to design
      ],
      cons: [
        - Hard to tune
      ],
      )
  ],
  image("./lexan-over-old.svg"),

  [
    == Create Lexan Flap to Aid Existing Wedges
    A lexan flap could be used to aid the wedges without having to lift the bot.
    #nb_pro_con(

      pros: [
        - Easy to fabricate
        - Easy to design
        - Easy to optimize
      ],
      cons: [
        - High complexity
      ],
      )
  ],
  image("./flap-over-old.svg")

)
