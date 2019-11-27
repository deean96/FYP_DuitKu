import 'package:flutter/material.dart';

class ViewExpenses extends StatefulWidget {
  @override
  _ViewExpensesState createState() => _ViewExpensesState();
}

class _ViewExpensesState extends State<ViewExpenses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Expenses"),
      ),
      body: Form(
        child: ListView(
        children: const <Widget>[
          Card(
            child: ListTile(
              title: Text('McDonalds Medan MARA'),
              subtitle: Text('29 October 2019'),
              trailing: Text('RM8.90')
            ),
          ),
          Card(
            child: ListTile(
              title: Text('MR D.I.Y. Quill City Mall'),
              subtitle: Text('20 October 2019'),
              trailing: Text('RM3.45')
            ),
          ),
        ],
      ),
      ),
    );
  }
}
