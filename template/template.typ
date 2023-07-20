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
    //
    #text(
      size: 50pt,
      font: "Tele-Marines"
    )[#organization]
      
    #line(length: 100%, stroke: (thickness: 3pt, cap: "round"))

    #v(1fr)

    #image(cover, width: 50%)

    #v(1fr)

    #text(
      size: 40pt, 
      font: "Tele-Marines"
    )[
      #season

      #team
    ]
  ])

  pagebreak()

  toc()

  
  body
}
