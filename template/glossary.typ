#import "./colors.typ": *
#import "./widgets.typ": *
#import "./globals.typ": *

#let nb_create_glossary_entry(title: none, definition: none) = {
  if type(title) == none {
    panic("no title")
  }

  if type(definition) == none {
    panic("no definition")
  }

  glossary_entries.update(it => {
    it.push((title: title, definition: definition))
    it
  })
}

#let nb_print_glossary() = [
  #page(
    footer: align(right)[
      #counter(page).display()
    ],
  )[
    #nb_heading([Glossary #h(1fr)])<nb_heading_glossary>

    #v(20pt)

    #columns(
      2,
    )[
      #locate(
        loc => {
          let sorted_glossary = glossary_entries.final(loc).sorted(key: ((title, _)) => title)

          for entry in sorted_glossary [
            #nb_heading([#entry.title], level: 2)
            #entry.definition
          ]
        },
      )
    ]
  ]
]
