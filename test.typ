// TODO:
// - equations
// - tables
// - code

#import "./open-colors.typ": *
#import "./components.typ": *
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
  /*

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
    */

  #lorem(100)

  #nb_admonition(type: "warning")[
    This could be bad for the economy
  ]

  #nb_admonition(type: "note")[
    This could be bad for the economy
  ]

  #nb_admonition(
    type: "equation",
  )[
    #grid(
      columns: (1fr, 1fr),
      [
        Assuming the following variables:
        - $d_"lead"$ is a constant set by us that dictates how far away the carrot point
          is from the end point.
      ],
      [
        $ h = sqrt(x_"current" - x_"target" + y_"current" - y_"target") $
        $ x_"carrot" = x_"target" - h sin(theta_"target") * d_"lead" $
        $ y_"carrot" = y_"target" - h cos(theta_"target") * d_"lead" $
      ],
    )
  ]

  Assuming the following variables:
  - $d_"lead"$ is a constant set by us that dictates how far away the carrot point
    is from the end point.
  - $x_"current"$ is the current x coordinate
  #nb_admonition(type: "equation")[
    \
    $ h = sqrt(x_"current" - x_"target" + y_"current" - y_"target") $
    $ x_"carrot" = x_"target" - h sin(theta_"target") * d_"lead" $
    $ y_"carrot" = y_"target" - h cos(theta_"target") * d_"lead" $
    \
  ]

  #tablex(
    auto-lines: false,
    columns: (1fr, 1fr, 1fr, 1fr),
    fill: (col, row) => {
      //if row == 1 {green.lighten(50%)}
      if calc.even(row) { surface_0 }
      if calc.odd(row) { surface_4 }
    },
    hlinex(stroke: (cap: "round", thickness: 1.5pt)),
    [],
    [*Versatility*],
    [*Power*],
    [*Flavour*],
    [*Sweet Potato*],
    [0],
    [0],
    [0],
    [*White Potato*],
    [0],
    [0],
    [0],
    [*Brown Potato*],
    [0],
    [0],
    [0],
  )
]
