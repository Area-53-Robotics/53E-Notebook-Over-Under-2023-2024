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

#let parse-timestamp(timestamp) = {
  let data = timestamp.matches(regex("(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2}).(\d{3})"))
  let captures = data.at(0).captures

  datetime(
    year: int(captures.at(0)),
    month: int(captures.at(1)),
    day: int(captures.at(2)),
    hour: int(captures.at(3)),
    minute: int(captures.at(4)),
    second: int(captures.at(5)),
  )
}

#let grid = grid.with(columns: (1fr, 1fr), gutter: 20pt)

#let get-page-number(label) = locate(loc => {
  let elements = query(label, loc)
  [#counter(page).at(elements.first().location()).first()]
})
