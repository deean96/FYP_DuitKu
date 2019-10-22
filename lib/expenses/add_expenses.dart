import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class AddExpenses extends StatefulWidget {
  @override
  _AddExpensesState createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  final format = DateFormat("dd-MM-yyyy");
  String _placeOfExpense, _expenseCategory;
  double _expenseAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add an Expense'),
      ),
      backgroundColor: Colors.green[200],
      body: Form(
        //key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(50),
            ),
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,

            TextFormField(
              decoration: InputDecoration(labelText: 'Location of Expense:'),
            ),

            DateTimeField(
              format: format,
              decoration: InputDecoration(labelText: 'Date of Expense:'),
              onShowPicker: (context, currentValue) {
                return showDatePicker(
                    context: context,
                    firstDate: DateTime(1900),
                    initialDate: currentValue ?? DateTime.now(),
                    lastDate: DateTime(2100));
              },
            ),

            TextFormField(
              decoration: InputDecoration(labelText: 'Category of Expenses:'),
            ),

            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Total Amount of Expenses:'),
              keyboardType: TextInputType.number,
            ),

            Row(children: <Widget>[
              Padding(
                padding: EdgeInsets.all(40),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('Add an Expense'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('Scan QR Code'),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
