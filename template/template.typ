#import "entries.typ": *
#import "toc.typ": *

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

  show link: underline

  // Content

  align(
    center,
    [
      // Title Page

      #text(
        size: 50pt,
        font: "Tele-Marines",
      )[#organization]

      #line(
        length: 100%,
        stroke: (thickness: 3pt, cap: "round"),
      )

      #v(1fr)

      #image(cover, width: 50%)

      #v(1fr)

      #text(
        size: 40pt,
        font: "Tele-Marines",
      )[
          #season

          #team
        ]
    ],
  )

  pagebreak()

  about

  nb_toc()

  intro

  print_entries()

  appendix
}
