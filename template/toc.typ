#import "./entries.typ": *
#import "./widgets.typ": *

#let nb_toc() = {
  page(
    footer: [#nb_frontmatter_footer()],
    [
    #nb_heading([Table of Contents])

    #nb_heading([Entries], level: 1)
    #locate(
      loc => {
        for entry in entries.final(loc) {
          [
          #nb_label(label: entry.type)
          #h(5pt)
          #entry.title
          #box(
            width: 1fr,
            line(length: 100%, stroke: (dash: "dotted")),
          )
          #entry.start_date.display("[year]/[month]/[day]") \
          ]
          if not entry.end_date == entry.start_date {
            align(
              right,
              [
              #box(
                outset: 0pt,
                [
                #line(
                  length: 15pt,
                  start: (-20pt, -8pt),
                  angle: 90deg,
                  stroke: (thickness: 1pt),
                )
                ],
              )
              \
              #entry.end_date.display("[year]/[month]/[day]")
              ],
            )
          }
        }
      },
    )

    #nb_heading([Appendix], level: 1)

    Glossary \
    #counter(page).update(_ => 0) //FIXME: this should not be here
    // Functions that depend on state like counter are actually content,
    // meaning that this creates a new page if used in the template
    ],
  )
}
