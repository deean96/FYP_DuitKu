import 'package:duitku/model/monthly_expenses.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class MonthlyExpensesChart extends StatelessWidget {
  final List<MonthlyExpensesSeries> data;

  MonthlyExpensesChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<MonthlyExpensesSeries, String>> series = [
      charts.Series(
          id: "Monthly Expenses",
          data: data,
          domainFn: (MonthlyExpensesSeries series, _) => series.month,
          measureFn: (MonthlyExpensesSeries series, _) =>
              series.monthlyExpenses,
          colorFn: (MonthlyExpensesSeries series, _) => series.barColor),
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
                "Monthly Expenses for Year 2019",
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
