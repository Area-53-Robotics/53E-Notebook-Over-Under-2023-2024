#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
title: "Program: Driver Control",
type: "program",
start_date: datetime(year: 2023, month: 8, day: 20)

)[

#link("https://github.com/LemLib/LemLib/pull/50")

```cpp

double calcDriveCurve(double input, double scale) {
BattleCh1cken marked this conversation as resolved.
    if (scale != 0) {
        return (powf(2.718, -(scale / 10)) + powf(2.718, (fabs(input) - 127) / 10) * (1 - powf(2.718, -(scale / 10)))) *
               input;
    }
    return input;
}

void Chassis::tank(int left, int right, float curveGain) {
BattleCh1cken marked this conversation as resolved.
    drivetrain.leftMotors->move(calcDriveCurve(left, curveGain));
    drivetrain.rightMotors->move(calcDriveCurve(right, curveGain));
};
```



]

