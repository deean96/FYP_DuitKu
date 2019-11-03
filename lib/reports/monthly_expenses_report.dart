import 'package:duitku/model/monthly_expenses.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:duitku/charts/monthly_expenses_chart.dart';
import 'package:flutter/material.dart';

class MonthlyExpensesReport extends StatelessWidget {
  final List<MonthlyExpensesSeries> data = [
    MonthlyExpensesSeries(
      month: "JAN",
      monthlyExpenses: 550,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    MonthlyExpensesSeries(
      month: "FEB",
      monthlyExpenses: 325,
      barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    MonthlyExpensesSeries(
      month: "MAR",
      monthlyExpenses: 400,
      barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    MonthlyExpensesSeries(
      month: "APR",
      monthlyExpenses: 418,
      barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    MonthlyExpensesSeries(
      month: "MAY",
      monthlyExpenses: 250,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    MonthlyExpensesSeries(
      month: "JUN",
      monthlyExpenses: 387,
      barColor: charts.ColorUtil.fromDartColor(Colors.yellow),
    ),
    MonthlyExpensesSeries(
      month: "JUL",
      monthlyExpenses: 196,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    MonthlyExpensesSeries(
      month: "AUG",
      monthlyExpenses: 800,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    MonthlyExpensesSeries(
      month: "SEP",
      monthlyExpenses: 238,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    MonthlyExpensesSeries(
      month: "OCT",
      monthlyExpenses: 298,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Monthly Expenses Report"),
      ),
      body: Center(
        child: Container(
          child: MonthlyExpensesChart(
            data: data,
          ),
        ),
      ),
    );
  }
}
