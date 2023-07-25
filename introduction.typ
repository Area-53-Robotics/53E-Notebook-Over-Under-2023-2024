#import "./template/entries.typ": *
#import "./template/colors.typ" : *

#nb_heading([Who We Are])
VRC Team 53E is part of the Area 53 Alien Raiders robotics club at Eleanor Roosevelt High School, which resides in Greenbelt, Maryland. The team has a long history, starting back in 2015 with the season Nothing But Net. 

    At the time, the team was composed of several sophomores, who all graduated in 2018. In the following year, the team was restarted as an all freshman team who went onto compete in both the Turning point and Tower Takeover seasons with much improving success. Unfortunately the team was broken up during the 2020/2021 season Change Up due to the subsequent nature of the Pandemic. We returned during the Tipping Point Season, and have continued to compete through the Spin Up season.

#pagebreak()

#nb_heading([Our Team])

// TODO: move to template
#let nb_member(name: "", picture: "", body) = [
  #rect(
    fill: surface_0,
    inset: 20pt,
    width: 200pt,
    height: 200pt,
    radius: 12pt
  )[
    = #name
    #line(length: 100%, stroke: (cap: "round", dash: "solid"))
    #v(8pt)
    #grid(
      columns: 2,
      gutter: 20pt,
      align(center,
        image(width: 80pt, height: 80pt, picture)
      ),
      align(left, body)
    )
  ]
]


#align(center)[
  #v(60pt)
  #grid(
    columns: 2,
    rows: 2,
    gutter: 20pt,
    [#nb_member(name: "Felix Hass", picture: "./assets/mugshots/felix.png")[
       - 12th Grade
       - Team Leader
       - Programmer
       - Notebooker
      ]],
    [#nb_member(name: "Alan Morales", picture: "./assets/mugshots/alan.jpg")[
      - 11th Grade
      - Builder
    ]],
    [#nb_member(name: "John Kelly", picture: "./assets/mugshots/john.png")[
      - 10th Grade
      - Builder
      - Driver
    ]],
    [#nb_member(name: "Meghana Noojipady", picture: "./assets/mugshots/meghana.jpg")[
      - 9th Grade
      - Programmer
    ]],
  )
]

#pagebreak()


