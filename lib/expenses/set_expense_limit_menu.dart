import 'package:duitku/expenses/set_monthly_expense_limit.dart';
import 'package:duitku/expenses/set_weekly_expense_limit.dart';
import 'package:flutter/material.dart';

class SetExpenseLimitMenu extends StatefulWidget {
  @override
  _SetExpenseLimitMenuState createState() => _SetExpenseLimitMenuState();
}

class _SetExpenseLimitMenuState extends State<SetExpenseLimitMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Expense Limit Menu'),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                  child: Text('Set Monthly Expense Limit'),
                  onPressed: setMonthlyExpenseLimit),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  child: Text('Set Weekly Expense Limit'),
                  onPressed: setWeeklyExpenseLimit),
            ),
          ],
        ),
      ),
    );
  }

  setMonthlyExpenseLimit() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SetMonthlyExpenseLimit()));
  }

  setWeeklyExpenseLimit() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => SetWeeklyExpenseLimit()));
  }
}
