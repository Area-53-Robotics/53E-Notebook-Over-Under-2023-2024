#import "./template/entries.typ": *

#nb_heading([Who We Are])
VRC Team 53E is part of the Area 53 Alien Raiders robotics club at Eleanor Roosevelt High School, which resides in Greenbelt, Maryland. The team has a long history, starting back in 2015 with the season Nothing But Net. 

    At the time, the team was composed of several sophomores, who all graduated in 2018. In the following year, the team was restarted as an all freshman team who went onto compete in both the Turning point and Tower Takeover seasons with much improving success. Unfortunately the team was broken up during the 2020/2021 season Change Up due to the subsequent nature of the Pandemic. We returned during the Tipping Point Season, and are continuing for the Spin Up Season.

#pagebreak()

#nb_heading([Our Team])

// TODO: move to template

#let nb_member(name: "", picture: "", body) = [
  #rect(
    fill: rgb("e4e5ea"),
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

#nb_heading([About This Notebook])

This notebook was written with a typesetting language called Typst. The source code can be found here: _#link("https://github.com/Area-53-Robotics/53E-Notebook")_.

== Why Digital

This is our third year using a digital notebook, and we find that it improves the experience for both the writer and the viewer in several ways.

- Increased neatness
- Better, more modern tooling

== Why Typst

Typst give us a whole host of benefits:

- management and collaboration with git and the online editor
- verification of history with git
- native scripting support
- native support for render math
- native support for rendering code

We chose Typst over LaTeX due to its more modern syntax and amazing scripting language.

== How to Read Entries

Entries all have a type, which is displayed in the top left corner, as well as in the table of contents. Most types correspond with a step in the engineering design process, but some do not.

Here are the existing types:

- #nb_label(label: "identify", long: true)
- #nb_label(label: "brainstorm", long: true)
- #nb_label(label: "decide", long: true)
- #nb_label(label: "build", long: true)
- #nb_label(label: "program", long: true)
- #nb_label(label: "test", long: true)
- #nb_label(label: "management", long: true)

Each heading will also have a corresponding tab to mark the page.


#pagebreak()
