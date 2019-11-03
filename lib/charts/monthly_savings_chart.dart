import 'package:duitku/model/monthly_savings.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class MonthlySavingsChart extends StatelessWidget {
  final List<MonthlySavingsSeries> data;

  MonthlySavingsChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<MonthlySavingsSeries, String>> series = [
      charts.Series(
          id: "Monthly Expenses",
          data: data,
          domainFn: (MonthlySavingsSeries series, _) => series.month,
          measureFn: (MonthlySavingsSeries series, _) => series.monthlySavings,
          colorFn: (MonthlySavingsSeries series, _) => series.barColor),
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
                "Monthly Savings for Year 2019",
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
