import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String user_email;
  String user_name;

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
    
    var card = new Card(
      child: new Column(
        children: <Widget>[
          new ListTile(
            leading: new Icon(Icons.account_box, color: Colors.black,size: 26.0,),
            title: new Text("Full Name:"
            ,style: new TextStyle(fontWeight: FontWeight.w400),),
            subtitle: new Text("$user_name"),
          ),
          new Divider(color: Colors.black87,indent: 16.0,),
           new ListTile(
            leading: new Icon(Icons.email, color: Colors.black,size: 26.0,),
            title: new Text("Email:"
            ,style: new TextStyle(fontWeight: FontWeight.w400),),
            subtitle: new Text("$user_email"),
          ),
        ],
      ),
    );
    final sizedBox = new Container(
      margin: new EdgeInsets.only(left: 1.0, right: 1.0),
      child: new SizedBox(
        height: 620.0,
        child: card,
      ),
    );
    final center = new Center(
      child: sizedBox,
    );
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.redAccent,
        title: InkWell(
            child: Text('My Account')),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: (){},),
        ],
      ),
        body: center,    
    );
  }
}