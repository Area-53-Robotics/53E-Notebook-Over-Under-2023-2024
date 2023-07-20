#import "entries.typ": *

#let toc() = {
  nb_heading([Table of Contents])

  // TODO: do this automatically somehow
  
  [

  #nb_heading([Introduction], level: 1)

  Who We Are \
  Our Team \
  About This Notebook \

  \
  #nb_heading([Entries], level: 1)

  ]

  locate(loc => {
    for entry in entries.final(loc) {
      [ #nb_label(label: entry.type) #h(5pt) #entry.title #h(1fr) #entry.date.display() \ ]
    }
  })
  
  [

  #nb_heading([Appendix], level: 1)


  Glossary \

  ]



  pagebreak()
}
