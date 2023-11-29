#import "../colors.typ": *

#import "@preview/cetz:0.1.2"

#let nb_pie_chart(..data) = {
  let total;
  let percentages = ();

  for value in data.pos() {
    total += value.at(0);
  }

  for value in data.pos() {
    percentages.push(calc.round(value.at(0) / total * 100))
  }

  cetz.canvas(
    {
      import cetz.draw: *

      let chart(..values, name: none) = {
        let values = values.pos()
        let anchor_angles = ()

        let offset = 0
        let total = values.fold(0, (s, v) => s + v.at(0))

        let segment(from, to) = {
          merge-path(close: true, {
            stroke((paint: black, join: "round", thickness: 0pt))
            line((0, 0), (rel: (360deg * from, 2)))
            arc((), start: from * 360deg, stop: to * 360deg, radius: 2)
          })
        }

        let chart = group(name: name, {
          stroke((paint: black, join: "round"))

          for v in values {
            fill(v.at(1))
            let value = v.at(0) / total

            // Draw the segment
            segment(offset, offset + value)

            // Place an anchor for each segment
            let angle = offset * 360deg + value * 180deg
            anchor(v.at(2), (angle, 1.75))
            anchor_angles.push(angle)

            offset += value
          }
        })

        return (chart, anchor_angles)
      }

      // Draw the chart
      let (chart, angles) = chart(..data, name: "chart")

      chart

      set-style(mark: (fill: white, start: "o", stroke: black), content: (padding: .1))
      for (index, value) in data.pos().enumerate() {
        let anchor = "chart." + value.at(2)
        let angle = angles.at(index)

        let (line_end, anchor_direction) = if angle > 90deg and angle < 275deg {
          ((-0.5, 0), "right")
        } else {
          ((0.5, 0), "left")
        }

        line(anchor, (to: anchor, rel: (angle, 0.5)), (rel: line_end))

        content((), [#value.at(2)], anchor: "bottom-" + anchor_direction)
        content((), [ #percentages.at(index)% ], anchor: "top-"+ anchor_direction)
      }
    },
  )
}

#let nb_plot() = {
  cetz.canvas(
    {
      import cetz.draw: *
      import cetz.plot
      plot.plot(size: (10, 10), x-tick-step: 180, y-tick-step: 1, x-unit: $degree$, {
        plot.add(domain: (0, 360), x => calc.sin(x * 1deg))
      })
    },
  )
}
