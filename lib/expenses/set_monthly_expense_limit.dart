import 'dart:async';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class SetMonthlyExpenseLimit extends StatefulWidget {
  SetMonthlyExpenseLimit({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SetMonthlyExpenseLimitState createState() => _SetMonthlyExpenseLimitState();
}

class _SetMonthlyExpenseLimitState extends State<SetMonthlyExpenseLimit> {
  double expenseLimit = 400.0;
  NumberPicker decimalNumberPicker;

  _handleValueChanged(num value) {
    if (value != null) {
      if (value is int) {
      } else {
        setState(() => expenseLimit = value);
      }
    }
  }

  _handleValueChangedExternally(num value) {
    if (value != null) {
      if (value is int) {
      } else {
        setState(() => expenseLimit = value);
        decimalNumberPicker.animateDecimalAndInteger(value);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    decimalNumberPicker = new NumberPicker.decimal(
        initialValue: expenseLimit,
        minValue: 1,
        maxValue: 999999,
        decimalPlaces: 2,
        onChanged: _handleValueChanged);
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Set Monthly Expense Limit'),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Set Monthly Your Expense Limit'),
                    SizedBox(width: 5.0),
                  ],
                ),
              ),
              decimalNumberPicker,
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Current Monthly Expense Limit is RM$expenseLimit'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.report_problem),
                    new Text(
                        'The best practice of limiting money is to keep it the lowest as possible.'),
                  ],
                ),
              ),
              new RaisedButton(
                onPressed: () => _showDoubleDialog(),
                //TODO: make save button update to users database
                child: new Text("Save"),
              ),
            ],
          ),
        ));
  }

  Future _showDoubleDialog() async {
    await showDialog<double>(
      context: context,
      builder: (BuildContext context) {
        return new NumberPickerDialog.decimal(
          minValue: 1,
          maxValue: 999999,
          decimalPlaces: 2,
          initialDoubleValue: expenseLimit,
          title: new Text("Set Your Monthly Expense Limit"),
        );
      },
    ).then(_handleValueChangedExternally);
  }
}
