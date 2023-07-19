#import "entries.typ": *

#let toc() = {
  [ = Table of Contents]
  line(length: 100%)

  // TODO: do this automatically somehow
  
  [

  == Introduction

  Who We Are \
  Our Team \
  About This Notebook \

  \
  == Entries

  ]

  locate(loc => {
    for entry in entries.final(loc) {
      [ #label(label: entry.type) #entry.title #h(1fr) #entry.date.display() \ ]
    }
  })
  
  [

  == Appendix

  Glossary \

  ]



  pagebreak()
}
