// TODO:
// - equations
// - tables
// - code

#import "./open-colors.typ": *
#import "@preview/tablex:0.0.5": tablex, rowspanx, colspanx, vlinex, hlinex
#import "./typst-boxes.typ": *

#show raw.where(block: false): box.with(
  fill: surface_2,
  inset: (x: 3pt, y: 0pt),
  outset: (y: 3pt),
  radius: 2pt,
)

#show raw.where(block: true): it => {
    set par(justify: false);
    // the line counter
    let i = 0;
    let box_radius = 1.5pt;

    let detail_radius = 1.5pt;
    let detailRadius = 3pt;
    if (it.lang != none) {
      grid(
        columns: (100%, 100%),
        column-gutter: (-100%),
        block(width: 100%, inset: 1em, {
          for line in it.text.split("\n") {
            box(width: 0pt, align(right, str(i + 1) + h(2em)))
            hide(line)
            linebreak()
            i = i + 1;
          }
        }),
        block(radius: box_radius, fill: surface_1, width: 100%, inset: 1em, {
          place(top + right, box(fill: surface_3, radius: detail_radius, outset: 3pt, it.lang))
          it
        })
      )
    } else {
      block(radius: box_radius, fill: surface_2, width: 100%, inset: 1em, it)
    }
  }

#set text(font: "Calibri", size: 11pt)

#let highlight(color: red, body, width: auto) = {
 box(fill: color, outset: 5pt, radius: 1.5pt, body, height: 1em, width: width)
}

#let nb_heading_new(level: 1, beggining: none, end: none, body) = [
#if level == 0 [
  #set text(size: 18pt, weight: "bold")

  #highlight(color: red)[
    #beggining
  ]
  #h(10pt)
  #highlight(color: red.lighten(50%), width: 1fr)[
    #box(
      baseline: 130%,
      body 
    )
  ]
  #h(10pt)
  #highlight(color: red.lighten(50%))[
    #box(
      baseline: 130%,
      end
    )
  ]
] else if level == 1 [
  #set text(size: 15pt, weight: "bold")
  #highlight(
    color: surface_0,
  )[
    #box(
      baseline: 130%,
      body
   )
  ]
] else if level == 2 [
  #set text(size: 13pt, weight: "bold")
  #body
]
]

#let original = read("./template/icons/warning.svg")
#let changed(fill) = original.replace(
  "<path",
  "<path style=\"fill: " + fill.to-hex() + "\""
)

#let nb_admonition(type: none, body) = [
  #rect(
    width: 100%,
    fill: red.lighten(80%),
    stroke: (left: 4pt + red),
    radius: 1.5pt,
    [
    #text(
      size: 15pt,
      fill: red,
      [#box(baseline: 30%, image.decode(changed(red), width: 1.5em)) *Warning*],
    )
    \
    #body
    ],
  )

]

#let nb_pro_con() = [
  #box(
  radius: 0pt,
  clip: true,
  tablex(
    columns: (1fr, 1fr),
    auto-lines: false,
    fill: (col, row) => {
      if row == 0 and col == 0 {green}
      if row == 0 and col == 1 {red}
      if row == 1 and col == 0 {green.lighten(80%)}
      if row == 1 and col == 1 {red.lighten(80%)}
    },

    (), vlinex(stroke: 2pt + white), (),
    [*Pros*],
    [*Cons*],
    [
      - #lorem(10)
      - #lorem(10)
    ],
    [
      - #lorem(10)
      - #lorem(10)
    ],

  )
  )
]


#tablex()

#page(
  header: [
    #nb_heading_new(
      beggining: image("./template/icons/hammer.svg", height: 1em),
      [
      Build: Drivetrain 
      ],
      end: [
        12/34/56
      ],
      level: 0
    )
    ],
  footer: [
    bob
  ]
)[


#lorem(50)

#nb_heading_new([Final Build], level: 1)

#lorem(50)

#nb_heading_new([Aspect 1], level: 2)

#lorem(20)

#nb_heading_new([Aspect 2], level: 2)

#lorem(20)

#grid(
  columns: (1fr,1fr),
  nb_pro_con()
)

```cpp
int main() {
  printf("Hello world\n");
  return 0;
}
```
Here's some code: `bob()`


#nb_admonition()[
  This could be bad for the economy
]
]
