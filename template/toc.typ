#import "entries.typ": *

#let nb_toc() = {
  nb_heading([Table of Contents])

  // TODO: do this automatically somehow
  
  [

  #nb_heading([Introduction], level: 1)

  Who We Are \
  Our Team \
  \

  #nb_heading([Entries], level: 1)

  ]

  locate(loc => {
    for entry in entries.final(loc) {
      [
        #nb_label(label: entry.type)
        #h(5pt)
        #entry.title
        #box(
          width: 1fr,
          line(
            length: 100%,
            stroke:
            (dash: "dotted")
          )
        )
        #entry.start_date.display("[year]/[month]/[day]") \ ]
      if not entry.end_date == entry.start_date {
        align(right,
          [
            #box(
              outset: 0pt,
              [
              // #line(length: 20pt, start: (-30pt, -10pt), stroke: (thickness: 0.5pt))
              #line(length: 20pt, start: (-20pt, -8pt), angle: 90deg, stroke: (thickness: 1pt))
              // #line(length: 20pt, start: (-30pt, 0pt), stroke: (thickness: 0.5pt))
            ])
            \
            #entry.end_date.display("[year]/[month]/[day]")
          ]
        )
      }
    }
  })
  
  [

  #nb_heading([Appendix], level: 1)


  Glossary \

  ]



  pagebreak()
}
