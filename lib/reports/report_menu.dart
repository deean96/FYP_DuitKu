import 'package:duitku/reports/monthly_expenses_report.dart';
import 'package:duitku/reports/monthly_savings_report.dart';
import 'package:duitku/reports/weekly_expenses_report.dart';
import 'package:duitku/reports/weekly_savings_report.dart';
import 'package:flutter/material.dart';

class ReportMenu extends StatefulWidget {
  @override
  _ReportMenuState createState() => _ReportMenuState();
}

class _ReportMenuState extends State<ReportMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Menu'),
      ),
      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                child: Text('Monthly Expenses Report'),
                onPressed: monthlyExpenseReport,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                child: Text('Weekly Expenses Report'),
                onPressed: weeklyExpenseReport,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                child: Text('Monthly Savings Report'),
                onPressed: monthlySavingsReport,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                child: Text('Weekly Savings Report'),
                onPressed: weeklySavingsReport,
              ),
            ),
          ],
        ),
      ),
    );
  }

  monthlyExpenseReport() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MonthlyExpensesReport()));
  }

  weeklyExpenseReport() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WeeklyExpensesReport()));
  }

  monthlySavingsReport() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MonthlySavingsReport()));
  }

  weeklySavingsReport() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => WeeklySavingsReport()));
  }
}
