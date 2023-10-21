#import "/template/entries.typ": *
#import "/template/colors.typ" : *
#import "/template/widgets.typ" : *

#page(
  footer: [
    #nb_frontmatter_footer()
  ],
  [
    #nb_heading([Our Team], level: 0)

    // TODO: move to template
    #let nb_member(name: "", picture: "", body) = [
      #rect(
        fill: surface_1,
        inset: 20pt,
        width: 200pt,
        height: 170pt,
        radius: 1.5pt,
      )[
        = #name
        #line(length: 100%, stroke: (cap: "round", dash: "solid", thickness: 1.5pt))
        #v(8pt)
        #grid(
          columns: 2,
          gutter: 20pt,
          align(center, image(width: 90pt, height: 90pt, picture)),
          align(left, body),
        )
      ]
    ]

    #align(
      center,
    )[
      #grid(
        columns: 2,
        rows: 2,
        gutter: 20pt,
        [
          #nb_member(name: "Felix Hass", picture: "./assets/mugshots/felix.jpg")[
            - 12th Grade
            - Team Leader
            - Programmer
            - Notebooker
          ]
        ],
        nb_member(name: "Alan Morales", picture: "./assets/mugshots/alan.jpg")[
          - 11th Grade
          - Design
          - Builder
        ],
        nb_member(name: "John Kelly", picture: "./assets/mugshots/john.png")[
          - 10th Grade
          - Design
          - Builder
          - Driver
        ],
        nb_member(name: "Joy Oladimejij", picture: "./assets/logo.png")[
          - 10th Grade
          - Programmer
          - Builder
        ],
        nb_member(name: "Meghana Noojipady", picture: "./assets/mugshots/meghana2.png")[
          - 9th Grade
          - Programmer
        ],
        nb_member(name: "Violet Ridge", picture: "./assets/logo.png")[
          - 9th Grade
          - Design
          - Builder
        ],
      )
    ]

  ],
)
