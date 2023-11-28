#import "/template/template.typ": *
#show: create_entry.with(
  title: "Test",
  type: "build",
  start_date: datetime(year: 2023, month: 11, day: 28),
)
= Top level heading

Any content that I put here should go in the entry.

`test`

```cpp
int main() {
  // ...
}
```

= Heading level 1

#lorem(50)

== Heading level 2

#lorem(50)

== Heading level 2

#lorem(50)

=== Heading level 3

#lorem(50)

#nb_admonition(type: "note")[
  #lorem(20)
]

= Heading level 1

#lorem(50)
