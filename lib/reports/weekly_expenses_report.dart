import 'package:duitku/model/weekly_expenses.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:duitku/charts/weekly_expenses_chart.dart';
import 'package:flutter/material.dart';

class WeeklyExpensesReport extends StatelessWidget {
  final List<WeeklyExpensesSeries> data = [
    WeeklyExpensesSeries(
      week: "Week 1",
      weeklyExpenses: 120,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    WeeklyExpensesSeries(
      week: "Week 2",
      weeklyExpenses: 110,
      barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    WeeklyExpensesSeries(
      week: "Week 3",
      weeklyExpenses: 95,
      barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    WeeklyExpensesSeries(
      week: "Week 4",
      weeklyExpenses: 70,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    WeeklyExpensesSeries(
      week: "Week 5",
      weeklyExpenses: 83,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weekly Expenses Report"),
      ),
      body: Center(
        child: Container(
          child: WeeklyExpensesChart(
            data: data,
          ),
        ),
      ),
    );
  }
}
