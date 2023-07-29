#import "./entries.typ": *
#import "./toc.typ": *
#import "./colors.typ": *

#let notebook(
  team: "",
  organization: "",
  cover: "",
  season: "",
  about: [],
  intro: [],
  appendix: [],
  body,
) = {
  // Styling rules
  set text(
    font: "Calibri",
    size: 11pt,
  )

  set heading()
  set footnote.entry(
    separator: none
  )

  show link: it => [
    #text(fill: blue,[ _ #it _ ])
  ]

  show figure: it => align(center)[
   #it.body
    _ #it.caption _ 
  ] 

  // Content

  align(
    center,
    [
      // Title Page




      #text(
        size: 24pt,
        font: "Tele-Marines",
      )[
          #text(size: 28pt)[
            Engineering Notebook
          ]

          #image(cover, height: 70%)

          2023 - 2024
          #line(
            length: 50%,
            stroke: (thickness: 2.5pt, cap: "round"),
          )
          Over Under

        ]
    ],
  )

  pagebreak()

  about

  intro

  nb_toc()

  print_entries()

  appendix
}
