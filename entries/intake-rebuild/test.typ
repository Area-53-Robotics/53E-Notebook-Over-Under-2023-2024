#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *
#import "/utils.typ": plot-from-csv

#show: create-body-entry.with(
  title: "Test: Intake Rebuild",
  type: "test",
  date: datetime(year: 2024, month: 2, day: 24),
)

Since the changes to the intake were mostly structural, we decided the most
important thing to test for would be friction, as this would tell us if our
design's construction was sound. We do this by collecting the power draw of the
motor while free spinning. A motor typically consumes around 1W of power under
ideal conditions while free spinning, so this is our target.

= Procedures

+ Download the program to the brain
```cpp
#ifdef LOGGING
  logger.telemetry(
      fmt::format("{},{},{}", LOGGING_INTAKE_ROUTE, motor->get_power(), motor->get_temperature()));
#endif
```
2. Connect to the robot with the Loginator
+ Make sure that the intake is not contacting anything, and can spin freely.
+ Run the code. This should spin the intake for exactly a minute.

= Results

== Before Tuning

#admonition(
  type: "warning",
)[
  We forgot to set Grafana to keep the data for a long enough time, so while data
  was recorded for the full minute, about half of it was deleted, and could not be
  recovered.
]

#let data = plot-from-csv(read("./Intake-data-2024-02-24_17_27_55.3850.csv"))
#plot(x-label: "Time (ms)", y-label: "Power Draw (Watts)", ..data)

As you can see from this data, the motors are consuming about 10W of power. This
is much higher than the desired 1W. Upon seeing this we began troubleshooting
the intake to see where the issue arose. We checked to make sure that the
structure and axles were square, and in doing so noticed that the holes in the
plastic sleds for the high strength axles were too small. We drilled them out,
and then ran the test again.

== After Tuning

After drilling out the holes we got much better results.

#let data = plot-from-csv(read("./Intake-data-2024-02-24_17_51_02.8800.csv"))
#plot(x-label: "Time (ms)", y-label: "Power Draw (Watts)", ..data)

The power draw has fallen to acceptable levels of error. Overall we're very
happy with how this redesign has gone, and are excited to compete with it at the
state championship.
