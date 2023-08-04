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

// TODO: make this into multiple columns

#let nb_print_glossary() = [
#page(
  footer: align(
    right,
  )[
    #counter(page).display()
    ],
)[
  #nb_heading([Glossary])
  #columns(
    2,
  )[
    #locate(
      loc =>{
        for entry in glossary_entries.final(loc) [
        #nb_heading([#entry.title], level: 2)
        #entry.definition
        ]
      },
    )
    ]
  ]
] 
