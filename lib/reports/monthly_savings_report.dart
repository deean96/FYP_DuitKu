import 'package:duitku/model/monthly_savings.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:duitku/charts/monthly_savings_chart.dart';
import 'package:flutter/material.dart';

class MonthlySavingsReport extends StatelessWidget {
  final List<MonthlySavingsSeries> data = [
    MonthlySavingsSeries(
      month: "JAN",
      monthlySavings: 0,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    MonthlySavingsSeries(
      month: "FEB",
      monthlySavings: 50,
      barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    MonthlySavingsSeries(
      month: "MAR",
      monthlySavings: 60,
      barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    MonthlySavingsSeries(
      month: "APR",
      monthlySavings: 55,
      barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    MonthlySavingsSeries(
      month: "MAY",
      monthlySavings: 80,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    MonthlySavingsSeries(
      month: "JUN",
      monthlySavings: 60,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    MonthlySavingsSeries(
      month: "JUL",
      monthlySavings: 55,
      barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    MonthlySavingsSeries(
      month: "AUG",
      monthlySavings: 42,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    MonthlySavingsSeries(
      month: "SEP",
      monthlySavings: 30,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    MonthlySavingsSeries(
      month: "OCT",
      monthlySavings: 70,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Monthly Savings Report"),
      ),
      body: Center(
        child: Container(
          child: MonthlySavingsChart(
            data: data,
          ),
        ),
      ),
    );
  }
}
