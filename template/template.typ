#import "./entries.typ": *
#import "./toc.typ": *
#import "./colors.typ": *
#import "./icons/icons.typ": *
#import "./glossary.typ": *
#import "./components/components.typ": *

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
  set text(font: "Calibri", size: 11pt)
  set page("us-letter")

  set footnote.entry(separator: none)

  show image: it => [
    #align(center)[
      #set text(font: "Virgil 3 YOFF")
      #it
    ]
  ]

  show link: it => [
    #text(fill: blue, [ _ #it _ ])
  ]

  show figure.caption: it => it.body

  show figure: it => align(center)[
    #it.body
    _ #it.caption _
  ]

  // Code blocks
  show raw.where(block: false): nb_raw_not_block
  show raw.where(block: true): it => nb_raw_block(it)

  // Headings
  show heading: it => nb_heading(it)

  // Content
  align(center, [
    // Title Page
    #text(size: 24pt, font: "Tele-Marines")[
      #text(size: 28pt)[
        Engineering Notebook
      ]

      #image(cover, height: 70%)

      2023 - 2024
      #line(length: 50%, stroke: (thickness: 2.5pt, cap: "round"))
      Over Under

    ]
  ])

  pagebreak()
  pagebreak()

  //about

  //intro

  nb_toc()

  print_entries()

  nb_print_glossary()
}
