import 'package:duitku/expenses/add_expenses.dart';
import 'package:duitku/expenses/set_expense_limit_menu.dart';
import 'package:duitku/expenses/view_expenses.dart';
import 'package:duitku/reports/report_menu.dart';
import 'package:duitku/reports/weekly_report_by_category.dart';
import 'package:duitku/user/profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  final VoidCallback signOut;

  HomePage(this.signOut);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String user_email = '', user_name = '';

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      user_email = preferences.getString("user_email");
      user_name = preferences.getString("user_name");
    });
  }

  @override
  void initState() {
    super.initState();
    getPref();
    dataMap.putIfAbsent("Food and Beverages", () => 5);
    dataMap.putIfAbsent("Groceries", () => 3);
    dataMap.putIfAbsent("Entertainment", () => 2);
    dataMap.putIfAbsent("Healthcare", () => 2);
    dataMap.putIfAbsent("Utillities", () => 4);
    dataMap.putIfAbsent("Others", () => 1);
  }

  signOut() {
    setState(() {
      widget.signOut();
    });
  }

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('EXPENSES THIS WEEK'),
            PieChart(
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
          ],
        ),
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            //Drawer Header
            new UserAccountsDrawerHeader(
              accountName: Text("$user_name"),
              accountEmail: Text("$user_email"),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              decoration: new BoxDecoration(color: Colors.grey),
            ),

            ListTile(
              title: Text("Home"),
              leading: Icon(Icons.home),
              onTap: () {},
            ),

            ListTile(
              title: Text("My Profile"),
              leading: Icon(Icons.account_box),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ProfilePage()));
              },
            ),

            ListTile(
              title: Text("Set Expense Limit"),
              leading: Icon(Icons.edit),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => SetExpenseLimitMenu()));
              },
            ),

            ListTile(
              title: Text("View Expenses"),
              leading: Icon(Icons.remove_red_eye),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ViewExpenses()));
              },
            ),

            ListTile(
              title: Text("Add Expenses"),
              leading: Icon(Icons.add),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AddExpenses()));
              },
            ),

            ListTile(
              title: Text("View Report"),
              leading: Icon(Icons.remove_red_eye),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => ReportMenu()));
              },
            ),

            ListTile(
              title: Text("Log Out"),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                signOut();
              },
            ),
          ],
        ),
      ),
    );
  }
}
