#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#import "/utils.typ": grid, plot-from-csv

#show: create-body-entry.with(
  title: "Notebook: Graphing",
  type: "notebook",
  date: datetime(year: 2024, month: 1, day: 20),
  author: "Felix Hass",
  witness: "Meghana Noojipady",
)

#metadata(none) <notebook-graphs>

While making graphs for this notebook we noticed that our workflow was very long
and convoluted. In order to get a graph into the notebook we had to:
+ Download the data from the Loginator as .csv file
+ Clean up the data so that it can be graphed
+ Plug the data into our python script, and plot it with MatPlotLib
+ Export the graph as a .png file
+ Move the .png into the notebook
+ Render the image with the `#image()` function

If we wanted to make changes to the graph we'd have to follow the entire process
again.

We decided we wanted a native Typst solution to this problem, to reduce the
amount of steps in this workflow. Typst supports parsing .csv files out of the
box, so we all we'd need to do is put the .csv file inside the notebook, and
then call our new plotting function. This means our new workflow looks like
this:

+ Down the data from the Loginator as a .csv file
+ Move the .csv file into the notebook's file structure
+ Call our graphing function

If we want to make changes, all we have to do is edit the .csv file. The
notebook will do the rest automatically.

= Implementation

We decided to separate the functions for parsing the .csv file and creating the
plot in order to allow the plot to be used without having a .csv file.

== CSV Parsing

```typ
#let gen-from-csv(data) = {
  let raw-data = csv.decode(data)
  let labels = raw-data.at(0)

  let data = ()

  for (label-index, label) in labels.enumerate() {
    if label-index == 0 { continue }
    let label-data = ()

    for (row-index, row) in raw-data.enumerate() {
      if row-index == 0 { continue }
      label-data.push((row-index, float(row.at(label-index)))) // TODO: actually parse the datetime (I need millisecond accuracy for this)
    }
    data.push((name: label, data: label-data))
  }

  return data
}
```

#admonition(
  type: "warning",
)[
  Currently our exports from the Loginator do not include timestamps that are
  accurate down to the millisecond. This means that in order to approximate the
  time we're simply using the index as our time. We'll fix this in the future.
]

== Plot Component

Our plot component is a wrapper around the CeTZ package's plotting library. We
did some basic styling, and simplified the API greatly.

```typ
#let plot(title: "", x-label: "", y-label: "", length: auto, ..data) = {
  // The length of the whole plot is 8.5 units.
  let length = if length == auto { 8.5% } else { length / 8.5 }

  // Will be populated by the names of the rows of data, and their corresponding colors
  let legend = ()

  set align(center)
  cetz.canvas(
    length: length,
    {
      import cetz.draw: *
      import cetz.plot
      import cetz.palette

      // Style for the data lines
      let plot-colors = (blue, red, green, yellow, pink, orange)
      let plot-style(i) = {
        let color = plot-colors.at(calc.rem(i, plot-colors.len()))
        return (
          stroke: (thickness: 1pt, paint: color, cap: "round", join: "round"),
          fill: color.lighten(75%),
        )
      }

      set-style(axes: (grid: (
        stroke: (paint: luma(66.67%), dash: "loosely-dotted", cap: "round"),
        fill: none,
      ), tick: (stroke: (cap: "round")), stroke: (cap: "round")))

      plot.plot(
        name: "plot",
        plot-style: plot-style,
        size: (9, 5),
        axis-style: "left",
        x-grid: "both",
        y-grid: "both",
        {
          for (index, row) in data.pos().enumerate() {
            plot.add(row.data)
            legend.push((color: plot-colors.at(index), name: row.name))
          }
        },
      )

      content("plot.north", [*#title*])
      content((to: "plot.south", rel: (0, -0.5)), [#x-label])
      content((to: "plot.west", rel: (-0.5, 0)), [#y-label], angle: 90deg)
    },
  )

  // legend time
  for label in legend [
    #box(rect(fill: label.color, radius: 1.5pt), width: 0.7em, height: 0.7em)
    #label.name
    #h(10pt)
  ]
}
```
= Examples

#grid([
```typ
  #let data = gen-from-csv(read("./data.csv"))
  #plot(
    title: "Flywheel PID Data",
    x-label: "Voltage (mV)",
    y-label: "Time (ms)",
    ..data // Flatten the data into individual arguments
  )
  ```
], {
  let data = plot-from-csv(read("./data.csv"))
  plot(
    title: "Flywheel PID Data",
    x-label: "Time (ms)",
    y-label: "Voltage (mV)",
    ..data,
  )
})

Overall we're very happy with how this turned out, and are excited to put it to
use. This has dramatically shortened the workflow needed to put graphs in the
notebook, and we hope to be able to visually present data in the notebook more
often.
