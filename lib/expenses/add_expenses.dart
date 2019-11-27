import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
//import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:convert';
import 'package:http/http.dart' as HTTP;
import 'dart:convert';

class AddExpenses extends StatefulWidget {
   AddExpenses({Key key, this.myTitle}) : super(key: key);

  final String myTitle;
  
  @override
  _AddExpensesState createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  final format = DateFormat("dd-MM-yyyy");
  String _placeOfExpense, _expenseCategory;
  String scanResult;
  double _expenseAmount;

  Future scanExpense() async {
    final barcodeScanResult = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.QR);
    
    setState(() {
      scanResult = barcodeScanResult;
    });

    //parse QRCode string value to REST API
    String url = "http://192.168.43.76:8080/duitku/api/expense_services.php?expense_location=" + barcodeScanResult;
    final response = await HTTP.post(url);
    final data = json.decode(response.body);
    print(barcodeScanResult.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add an Expense'),
      ),
      body: Form(
        //key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(50),
              ),
              new Text(scanResult != null ? scanResult : 'Scan Text Here'),

              /*TextFormField(
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
              ),*/

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
                  onPressed: () {
                    scanExpense();
                  },
                  //icon: Icon(Icons.camera_alt),
                  child: Text('Scan QR Code'),
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
