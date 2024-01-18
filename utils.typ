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

// TODO: add parse datetime function here
#let grid = grid.with(columns: (1fr, 1fr), gutter: 20pt)
