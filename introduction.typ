= Who We Are

VRC Team 53E is part of the Area 53 Alien Raiders robotics club at Eleanor Roosevelt High School, which resides in Greenbelt, Maryland. The team has a long history, starting back in 2015 with the season Nothing But Net. 

    At the time, the team was composed of several sophomores, who all graduated in 2018. In the following year, the team was restarted as an all freshman team who went onto compete in both the Turning point and Tower Takeover seasons with much improving success. Unfortunately the team was broken up during the 2020/2021 season Change Up due to the subsequent nature of the Pandemic. We returned during the Tipping Point Season, and are continuing for the Spin Up Season.

#pagebreak()

= Our Team

#line(length: 100%)

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

= About This Notebook

This notebook was written with a typesetting language called Typst. The source code can be found here TODO.

== Why Digital

This is our third year using a digital notebook. We find that this makes the already difficult job of notebooker easier, and also creates neater results, and lets us use more modern tools to better represent information.

== Why Typst

Typst is a typesetting language which is similar to LaTeX. This gives us good tools for representing code and mathematics in a clear and consise manner. It also gives us a turing complete scripting language, which lets us do many powerful things, like automatically index entries into a table of contents. We chose it over LaTeX due to its more modern syntax, and much better scripting support.

== How to Read Entries

Entries will have color coded subsections that detail what part of the engineering design process they pertain to.

Here are the existing entry subsections:

// TODO: put in the correct ones

// #identify \
// #brainstorm \
// #decide \
// #build \
// #program \
// #test \
// #repeat \
// #management \

Each heading will also have a corresponding tab to mark the page.


#pagebreak()
