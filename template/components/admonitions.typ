#import "../colors.typ": *
#import "../icons/icons.typ": *
#import "@preview/showybox:2.0.1": showybox

#let nb_admonition(type: "", body) = {
  let info = admonition_type_metadata.at(type)
  let colored_icon = nb_change_icon_color(raw_icon: info.icon, fill: info.color)

  showybox(
    frame: (
      border-color: info.color,
      body-color: info.color.lighten(80%),
      thickness: (left: 4pt),
      radius: 1.5pt,
    ),
    [
      #text(
        size: 15pt,
        fill: info.color,
        [
          #box(baseline: 30%, image.decode(colored_icon, width: 1.5em)) *#info.title*
        ],
      )
      \
      #body
    ],
  )
}
