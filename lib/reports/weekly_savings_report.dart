import 'package:duitku/model/weekly_savings.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:duitku/charts/weekly_savings_chart.dart';
import 'package:flutter/material.dart';

class WeeklySavingsReport extends StatelessWidget {
  final List<WeeklySavingsSeries> data = [
    WeeklySavingsSeries(
      week: "Week 1",
      weeklySavings: 0,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    WeeklySavingsSeries(
      week: "Week 2",
      weeklySavings: 10,
      barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    WeeklySavingsSeries(
      week: "Week 3",
      weeklySavings: 15,
      barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    WeeklySavingsSeries(
      week: "Week 4",
      weeklySavings: 20,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    WeeklySavingsSeries(
      week: "Week 5",
      weeklySavings: 17,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weekly Savings Report"),
      ),
      body: Center(
        child: Container(
          child: WeeklySavingsChart(
            data: data,
          ),
        ),
      ),
    );
  }
}
