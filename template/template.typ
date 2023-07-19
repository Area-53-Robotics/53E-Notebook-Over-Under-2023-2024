#import "entries.typ": *
#import "toc.typ": *

#let notebook(
  team: "",
  organization: "",
  cover: "",
  season: "",
  body
) = {

  set text(
    font: "Calibri",
    size: 11pt,
  )

  align(center, [
    #set heading()
    // Title Page

    #organization
  
    #line(length: 100%)

    #image(cover, width: 80%)

    #season

    #team
  ])

  pagebreak()

  toc()

  
  body
}
