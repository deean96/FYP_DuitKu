import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WeeklyReportByCategory extends StatefulWidget {
  @override
  _WeeklyReportByCategoryState createState() => _WeeklyReportByCategoryState();
}

class _WeeklyReportByCategoryState extends State<WeeklyReportByCategory> {
  bool toggle = false;
  Map<String, double> dataMap = new Map();
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
  ];

  @override
  void initState() {
    super.initState();
    dataMap.putIfAbsent("Food and Beverages", () => 5);
    dataMap.putIfAbsent("Groceries", () => 3);
    dataMap.putIfAbsent("Entertainment", () => 2);
    dataMap.putIfAbsent("Healthcare", () => 2);
    dataMap.putIfAbsent("Utillities", () => 4);
    dataMap.putIfAbsent("Others", () => 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weekly Report By Category"),
      ),
      body: Container(
        child: PieChart(
          dataMap: dataMap,
          legendFontColor: Colors.white,
          legendFontSize: 14.0,
          legendFontWeight: FontWeight.w500,
          animationDuration: Duration(milliseconds: 800),
          chartLegendSpacing: 32.0,
          chartRadius: MediaQuery.of(context).size.width / 2.7,
          showChartValuesInPercentage: true,
          showChartValues: true,
          showChartValuesOutside: false,
          chartValuesColor: Colors.blueGrey[900].withOpacity(0.9),
          colorList: colorList,
          showLegends: true,
          decimalPlaces: 1,
          showChartValueLabel: true,
          chartValueFontSize: 12,
          chartValueFontWeight: FontWeight.bold,
          chartValueLabelColor: Colors.grey[200],
          initialAngle: 0,
        ),
      ),
    );
  }
}
