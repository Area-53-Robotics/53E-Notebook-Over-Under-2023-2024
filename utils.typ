#let tournament-from-csv(section: "", team-name: "", raw-data) = {
  let parse-match(name) = {
    let sample-name = "Qualifier #1"
    let result = name.matches(regex("Qualifier #(\d+)"))

    if result == () {
      return (false, name)
    }
    return (true, [Q#result.at(0).captures.at(0)])
  }

  let data = csv.decode(raw-data)
  data = data.slice(1)
  let result = ()

  for row in data {
    if row.contains(team-name) {
      let winning-alliance = row.at(8)

      let match-name = parse-match(row.at(1))

      if section == "qualifications" and not match-name.at(0) { continue }
      if section == "eliminations" and match-name.at(0) { continue }

      let match = (
        match: match-name.at(1),
        red-alliance: (teams: (row.at(2), row.at(3)), score: row.at(6)),
        blue-alliance: (teams: (row.at(4), row.at(5)), score: row.at(7)),
        auton: false,
        awp: false,
      )

      match.won = if (
        (
          match.red-alliance.teams.contains(team-name) and winning-alliance == "Red"
        ) or (
          match.blue-alliance.teams.contains(team-name) and winning-alliance == "Blue"
        )
      ) { true } else { false }

      result.push(match)
    }
  }

  result
}

#let plot-from-csv(data) = {
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
  if elements.len() == 0 {
    panic(label)
  }

  [
    #counter(page).at(elements.first().location()).first()
  ]
})
