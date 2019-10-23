import 'package:duitku/expenses/add_expenses.dart';
import 'package:duitku/expenses/set_expenses_limit.dart';
import 'package:duitku/expenses/view_expenses.dart';
import 'package:duitku/user/profile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:duitku/user/login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  String user_email, user_name;

  getPref() async{
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
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
                    builder: (BuildContext context) => SetExpensesLimit()));
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
            ),

            ListTile(
              title: Text("Log Out"),
              leading: Icon(Icons.exit_to_app),
            ),
          ],
        ),
      ),
    );
  }
}
