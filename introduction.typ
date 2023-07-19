#import "./template/entries.typ": *

#nb_heading([Who We Are])
VRC Team 53E is part of the Area 53 Alien Raiders robotics club at Eleanor Roosevelt High School, which resides in Greenbelt, Maryland. The team has a long history, starting back in 2015 with the season Nothing But Net. 

    At the time, the team was composed of several sophomores, who all graduated in 2018. In the following year, the team was restarted as an all freshman team who went onto compete in both the Turning point and Tower Takeover seasons with much improving success. Unfortunately the team was broken up during the 2020/2021 season Change Up due to the subsequent nature of the Pandemic. We returned during the Tipping Point Season, and are continuing for the Spin Up Season.

#pagebreak()

#nb_heading([Our Team])

#let member(name: "", picture: "", body) = [
  == #name
  
  #image("assets/logo.png", width: 50%)

  #body

] 


#let cell = rect.with(
  inset: 8pt,
  fill: rgb("e4e5ea"),
  width: 100%,
  radius: 12pt
)

#set align(center)

#grid(
  columns: (220pt, 220pt ),
  rows: (220pt, 220pt),
  gutter: 10pt,
  cell(height: 100%)[#member(name: "Felix Hass", picture: "", [
    - 12th Grade
    - Team Leader
    - Lead Programmer
    - Rust Enthusiast
  ])],
  cell(height: 100%)[#member(name: "John Doe", picture: "", [generic dude])],
  cell(height: 100%)[#member(name: "John Doe", picture: "", [generic dude])],
  cell(height: 100%)[#member(name: "John Doe", picture: "", [generic dude])],
)

#set align(left)


#pagebreak()

#nb_heading([About This Notebook])

This notebook was written with a typesetting language called Typst. The source code can be found here: _#link("https://github.com/Area-53-Robotics/53E-Notebook")_.

== Why Digital

This is our third year using a digital notebook. We find that this makes the already difficult job of notebooker easier, and also creates neater results, and lets us use more modern tools to better represent information.

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
