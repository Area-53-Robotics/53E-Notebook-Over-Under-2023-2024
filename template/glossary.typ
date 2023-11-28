#import "./colors.typ": *
#import "./components/components.typ": *
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
    columns: 2,
    header: [
      #nb_title[Glossary] <nb_glossary>
    ],
    footer: align(right)[
      #counter(page).display()
    ],
  )[
    #locate(
      loc => {
        let sorted_glossary = glossary_entries.final(loc).sorted(key: ((title, _)) => title)

        for entry in sorted_glossary [
          == #entry.title
          #entry.definition

        ]
      },
    )

  ]
]
