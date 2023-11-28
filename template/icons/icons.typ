#import "../colors.typ": *

#let nb_question_mark = read("./question-mark.svg")
#let nb_light_bulb = read("./light-bulb.svg")
#let nb_target = read("./light-bulb.svg")
#let nb_hammer = read("./hammer.svg")
#let nb_terminal = read("./terminal.svg")
#let nb_flask = read("./flask.svg")
#let nb_bar_chart = read("./bar-chart.svg")
#let nb_page = read("./page.svg")

#let nb_pencil = read("./pencil.svg")
#let nb_warning = read("./warning.svg")
#let nb_web = read("./web.svg")
#let nb_quotes = read("./quotes.svg")
#let nb_function = read("./function.svg")

// Images are stored undecoded so they can be changed later
#let entry_type_metadata = (
  "identify": (icon: nb_question_mark, color: yellow),
  "brainstorm": (icon: nb_light_bulb, color: orange),
  "decide": (icon: nb_target, color: blue),
  "build": (icon: nb_hammer, color: red),
  "program": (icon: nb_terminal, color: purple),
  "test": (icon: nb_flask, color: green),
  "management": (icon: nb_bar_chart, color: surface_4),
  "notebook": (icon: nb_page, color: pink),
)

#let admonition_type_metadata = (
  "note": (icon: nb_pencil, color: green, title: "Note"),
  "warning": (icon: nb_warning, color: red, title: "Warning"),
  "example": (icon: nb_web, color: purple, title: "Example"),
  "quote": (icon: nb_quotes, color: gray, title: "Quote"),
  "equation": (icon: nb_function, color: orange, title: "Equation"),
  "decision": (
    icon: entry_type_metadata.at("decide").icon,
    color: entry_type_metadata.at("decide").color,
    title: "Final Decision",
  ),
  "build": (
    icon: entry_type_metadata.at("build").icon,
    color: entry_type_metadata.at("build").color,
    title: "Build Complete",
  ),
)

// Returns the raw image data, not image content
// You'll still need to run image.decode on the result
#let nb_change_icon_color(raw_icon: "", fill: red) = {
  return raw_icon.replace("<path", "<path style=\"fill: " + fill.to-hex() + "\"")
}
