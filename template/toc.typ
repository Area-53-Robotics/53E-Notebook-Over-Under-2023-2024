#import "./entries.typ": *
#import "./widgets.typ": *

#let nb_toc() = {
  page(
    header: nb_heading([Table of Contents], level: 0),
    footer: nb_frontmatter_footer(),
    [

      #nb_heading([Entries], level: 1)

      

      #locate(
        loc => {
          // FIXME: its not displaying the page number correctly
          let headings = query(selector(<nb_entry>), loc)

          for (index, entry) in entries.final(loc).enumerate() {
            let page_number = counter(page).at(headings.at(index).location()).at(0)
            let start_date = entry.start_date.display("[year]/[month]/[day]")
            let end_date = if (not entry.start_date == entry.end_date) { entry.end_date.display("[year]/[month]/[day]") } else { none }
            [
              #start_date#h(5pt)
              #nb_label(label: entry.type)
              #h(5pt)
              #entry.title
              #box(width: 1fr, line(length: 100%, stroke: (dash: "dotted")))
              #page_number \
            ]
          }
          [

            #nb_heading([Appendix], level: 1)

            #let glossary = query(selector(<nb_heading_glossary>), loc)
            Glossary #box(width: 1fr, line(length: 100%, stroke: (dash: "dotted"))) #counter(page).at(glossary.at(0).location()).at(0)
            #counter(page).update(_ => 0)
          ]
        },
      )

    ],
  )
}
