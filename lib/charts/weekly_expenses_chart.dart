import 'package:duitku/model/weekly_expenses.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class WeeklyExpensesChart extends StatelessWidget {
  final List<WeeklyExpensesSeries> data;

  WeeklyExpensesChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<WeeklyExpensesSeries, String>> series = [
      charts.Series(
          id: "Weekly Expenses",
          data: data,
          domainFn: (WeeklyExpensesSeries series, _) => series.week,
          measureFn: (WeeklyExpensesSeries series, _) => series.weeklyExpenses,
          colorFn: (WeeklyExpensesSeries series, _) => series.barColor),
    ];

    return Container(
      height: 600,
      padding: EdgeInsets.all(20),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Weekly Expenses for October 2019",
                style: TextStyle(color: Colors.black),
              ),
              Expanded(
                child: charts.BarChart(series, animate: true),
              )
            ],
          ),
        ),
      ),
    );
  }
}
