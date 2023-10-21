#import "./open-colors.typ": *
#import "@preview/showybox:2.0.1": showybox

//TODO: make this API cleaner
#let warning = read("./template/icons/warning.svg")

#let change_icon_color(icon, fill) = icon.replace("<path", "<path style=\"fill: " + fill.to-hex() + "\"")
#let nb_admonition(type: "", body) = {
  let color;
  let icon;
  let title;

  // I hate everthing about this
  if type == "note" {
    title = "Note"
    icon = "./template/icons/pencil.svg"
    color = green
  } else if type == "warning" {
    title = "Warning"
    icon = "./template/icons/warning.svg"
    color = red
  } else if type == "example" {
    title = "Example"
    icon = "./icons/web.svg"
    color = purple
  } else if type == "quote" {
    title = "Quote"
    icon = "./icons/quotes.svg"
    color = gray
  } else if type == "equation" { // TODO: make equation its own function, choose a color other than yellow :v(
    title = "Equation"
    icon = "./template/icons/function.svg"
    color = deep_orange
  } else if type == "decision" {
    title = "Final Decision"
    icon = "./icons/target.svg"
    color = blue
  } else if type == "build" {
    title = "Build Complete"
    icon = "./icons/hammer.svg"
    color = red
  } else {
    panic("invalid admonition type")
  }

  let original_icon = read(icon)
  let colored_icon = change_icon_color(original_icon, color)

  showybox(frame: (
    border-color: color,
    body-color: color.lighten(80%),
    thickness: (left: 4pt),
    radius: 1.5pt,
  ), [
    #text(size: 15pt, fill: color, [
      #box(baseline: 30%, image.decode(colored_icon, width: 1.5em)) *#title*
    ])
    \
    #body
  ])
}
