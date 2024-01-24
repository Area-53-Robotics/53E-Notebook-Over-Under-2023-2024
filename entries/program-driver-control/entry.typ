#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Program: Driver Control",
  type: "program",
  date: datetime(year: 2023, month: 8, day: 20),
  author: "Meghana Noojipady",
  witness: "Alan Morales",
)

With the control scheme and curve strength selected we finished the
implementation.

Here's the code for the drive curve:

```cpp
double calcDriveCurve(double input, double scale) {
  BattleCh1cken marked this conversation as resolved.if (scale != 0) {
    return (powf(2.718, -(scale / 10)) + powf(2.718, (fabs(input) - 127) / 10) *
                                             (1 - powf(2.718, -(scale / 10)))) *
           input;
  }
  return input;
}```

Here's the code for tank drive:

```cpp
void Chassis::tank(int left, int right, float curveGain) {
  drivetrain.leftMotors->move(calcDriveCurve(left, curveGain));
  drivetrain.rightMotors->move(calcDriveCurve(right, curveGain));
};
```

Since LemLib is already controlling our chassis we decided to submit our drive
code implementation to LemLib as it was currently lacking this feature. The
relevant pull request can be found here:

#link("https://github.com/LemLib/LemLib/pull/50")
