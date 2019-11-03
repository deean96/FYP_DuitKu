import 'package:duitku/model/weekly_savings.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class WeeklySavingsChart extends StatelessWidget {
  final List<WeeklySavingsSeries> data;

  WeeklySavingsChart({@required this.data});

  @override
  Widget build(BuildContext context) {
    List<charts.Series<WeeklySavingsSeries, String>> series = [
      charts.Series(
          id: "Weekly Expenses",
          data: data,
          domainFn: (WeeklySavingsSeries series, _) => series.week,
          measureFn: (WeeklySavingsSeries series, _) => series.weeklySavings,
          colorFn: (WeeklySavingsSeries series, _) => series.barColor),
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
                "Weekly Savings for October 2019",
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
