// formatting utilities

#let highlight(
  color: red,
  body
) = {
  box(
    fill: color,
    outset: 3pt,
    radius: 5pt,
    body
  )
}

// TODO: upgrade these to a subset of the label function
/*
#let identify = [ #highlight(color: yellow, [ == ** Identify <identify>]) ]
#let brainstorm = [ #highlight(color: orange, [ == ** Brainstorm <brainstorm>]) ]
#let decide = [ #highlight(color: blue, [ == *󰣉* Select Best Solution <decide>]) ]
#let build = [ #highlight(color: red, [ == *󱌣* Build the Solution <build>]) ]
#let program = [ #highlight(color: purple, [ == ** Program the Solution <program>]) ]
#let test = [ #highlight(color: teal, [ == ** Test Solution <test>]) ]
#let repeat = [ #highlight(color: green, [ == ** Repeat Design Process <repeat>]) ]
#let management = [ #highlight(color: gray, [ == ** Project Management <management>]) ]
*/

#let label(label: "", long: false) = {
  if label == "identify" [
    #highlight(color: yellow, image("icons/question-mark.svg", height: 0.9em)) 
  ] else if label == "brainstorm" [
    #highlight(color: orange, [ #image("icons/light-bulb.svg", height: 0.9em) ])
  ] else if label == "decide" [
    #highlight(color: blue, [ #image("icons/target.svg", height: 0.9em) ])
  ] else if label == "build" [
    #highlight(color: red, [ #image("icons/hammer.svg", height: 0.9em) ])
  ] else if label == "program" [
    #highlight(color: purple, [ #image("icons/terminal.svg", height: 0.9em) ])
  ] else if label == "test" [
    #highlight(color: teal, [ #image("icons/flask.svg", height: 0.9em) ])
  ] else if label == "repeat" [
    #highlight(color: green, [ #image("icons/refresh.svg", height: 0.9em) ])
  ] else if label == "management" [
    #highlight(color: gray, [ #image("icons/bar-chart.svg", height: 0.9em) ])
  ] else {
    panic("invalid option passed to label funtion")
  }
}

#let entries = state("entries", ())

#let create_entry(title: "", type: "", date: datetime(year: 1970, month: 1, day: 1), body) = {
  entries.update(x => {
    x.push((title: title, type: type, date: date, body: body))
    x
   }) 
}

#let print_entries() = {
  locate(loc => {
    for entry in entries.final(loc) {
      [
        #set page(
          footer: [
          Designed by: \
          Witnessed by: #h(1fr) #counter(page).display()
          ]
        )
        = #label(label: entry.type) #entry.title #h(1fr) #entry.date.display() \

        #line(length: 100%)

        
        #entry.body
      ]
    } 
  })
}

