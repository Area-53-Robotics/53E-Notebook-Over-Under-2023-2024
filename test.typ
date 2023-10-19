// TODO:
// - equations
// - tables
// - code

#import "./open-colors.typ": *
#import "@preview/tablex:0.0.5": *
#import "@preview/showybox:2.0.1": showybox

#set text(font: "Calibri", size: 11pt)

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
        place(
          top + right,
          box(fill: surface_3, radius: detail_radius, outset: 3pt, it.lang),
        )
        it
      }),
    )
  } else {
    block(radius: box_radius, fill: surface_2, width: 100%, inset: 1em, it)
  }
}

#let highlight(color: red, body, width: auto) = {
  box(
    fill: color,
    outset: 5pt,
    radius: 1.5pt,
    body,
    height: 1em,
    width: width,
  )
}

#let nb_heading_new(level: 1, beggining: none, end: none, body) = [
  #if level == 0 [
    #set text(size: 18pt, weight: "bold")

    #highlight(color: red)[
      #beggining
    ]
    #h(10pt)
    #highlight(color: red.lighten(50%), width: 1fr)[
      #box(baseline: -30%, body)
    ]
    #h(10pt)
    #highlight(color: red.lighten(50%))[
      #box(baseline: -30%, end)
    ]
  ] else if level == 1 [
    #set text(size: 15pt, weight: "bold")
    #highlight(color: surface_0)[
      #box(baseline: 130%, body)
    ]
  ] else if level == 2 [
    #set text(size: 13pt, weight: "bold")
    #body
  ]
]

#let original = read("./template/icons/warning.svg")
#let change_icon_color(fill) = original.replace("<path", "<path style=\"fill: " + fill.to-hex() + "\"")

#let nb_pro_con() = [
  #let cell = rect.with(width: 100%, inset: 5pt)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 4pt,
    cell(fill: green, radius: (top: 1.5pt))[*Pros*],
    cell(fill: red, radius: (top: 1.5pt))[*Cons*],
    cell(fill: green.lighten(80%), radius: (bottom: 1.5pt))[
      - #lorem(10)
      - #lorem(10)
    ],
    cell(fill: red.lighten(80%), radius: (bottom: 1.5pt))[
      - #lorem(10)
    ],
  )

]

#page(
  header: [
    #nb_heading_new(beggining: image("./template/icons/hammer.svg", height: 1em), [
      Build: Drivetrain
    ], end: [
      12/34/56
    ], level: 0)
  ],
  footer: [
    bob
  ],
)[

  #lorem(50)

  #nb_heading_new([Final Build], level: 1)

  #lorem(50)

  #nb_heading_new([Aspect 1], level: 2)

  #lorem(20)

  #nb_heading_new([Aspect 2], level: 2)

  #lorem(20)

  #grid(columns: (1fr, 1fr), nb_pro_con())

  ```cpp
  int main() {
    printf("Hello world\n");
    return 0;
  }
  ```
  Here's some code: `bob()`

  #showybox(
    frame: (
      border-color: red,
      body-color: red.lighten(80%),
      thickness: (left: 4pt),
      radius: 1.5pt,
    ),
    [
      #text(
        size: 15pt,
        fill: red,
        [
          #box(baseline: 30%, image.decode(change_icon_color(red), width: 1.5em)) *Warning*
        ],
      )
      \
      This could be bad for the economy. #lorem(50)
    ],
  )

  #lorem(100)

  #tablex(
    auto-lines: false,
    columns: (1fr, 1fr, 1fr, 1fr),
    fill: (col, row) => {
      //if row == 1 {green.lighten(50%)}
      if calc.even(row) {surface_0}
      if calc.odd(row) {surface_4}
    },


    hlinex(stroke: (cap: "round", thickness: 1.5pt)),
    [], [*Versatility*], [*Power*], [*Flavour*],
    [*Sweet Potato*], [0], [0], [0],
    [*White Potato*], [0], [0], [0],
    [*Brown Potato*], [0], [0], [0],
  )
]
