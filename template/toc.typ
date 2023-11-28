#import "./entries.typ": *
#import "./components/components.typ": *

#let nb_toc() = [
  #set page(header: nb_title([Table of Contents]), footer: nb_frontmatter_footer())
  = Entries

  #locate(
    loc => {
      let headings = query(selector(<nb_entry>), loc)

      for (index, entry) in entries.final(loc).enumerate() {
        let page_number = counter(page).at(headings.at(index).location()).at(0)
        let start_date = entry.start_date.display("[year]/[month]/[day]")
        let end_date = entry.end_date.display("[year]/[month]/[day]")
        [
          #end_date#h(5pt)
          #nb_label(label: entry.type)
          #h(5pt)
          #entry.title
          #box(width: 1fr, line(length: 100%, stroke: (dash: "dotted")))
          #page_number \
        ]
      }
      v(2pt)
      [
        = Appendix

        #let glossary = query(selector(<nb_glossary>), loc)
        Glossary #box(width: 1fr, line(length: 100%, stroke: (dash: "dotted"))) #counter(page).at(glossary.at(0).location()).at(0)
        #counter(page).update(_ => 0)
      ]
    },
  )
]
