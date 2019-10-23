import 'package:duitku/user/register.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

enum LoginStatus{
  notSignIn,
  signIn
}

class _LoginPageState extends State<LoginPage> {
 LoginStatus _loginStatus = LoginStatus.notSignIn;
  String user_email, user_password;
  final _key = new GlobalKey<FormState>();

bool _hidePassword =true;  

//hide password
  showPassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

check(){
  final form = _key.currentState;
  if(form.validate()){
    form.save();
    login();
  }
}

login() async{
  final response = await http.post("http://192.168.0.127:8080/duitku/api/login.php",
  body:{
    "user_email" : user_email,
      "user_password" : user_password
  });
  final data = jsonDecode(response.body);
  int value = data['value'];
    String message = data['message'];
    String user_emailAPI = data['user_email'];
    String user_passwordAPI = data['user_password'];
    String user_nameAPI = data['user_name'];

  if(value==1){
   setState(() {
     _loginStatus = LoginStatus.signIn;
     savePref(value, user_emailAPI, user_passwordAPI, user_nameAPI);
   });
    print(message);
  }else{
    print(message);
  }  
}

savePref(int value, String user_email, String user_password, String user_name)async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  setState(() {
   preferences.setInt("value", value);
       preferences.setString("user_name", user_name);
       preferences.setString("user_email", user_email);
       preferences.setString("user_password", user_password);
       preferences.commit();
  });
}

var value;
getPref()async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  setState(() {
    value = preferences.getInt("value");

    _loginStatus = value == 1? LoginStatus.signIn : LoginStatus.notSignIn;
  });
}

signOut()async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  setState(() {
   preferences.setInt("value", null);
   preferences.commit();
   _loginStatus = LoginStatus.notSignIn;
  });
}


  @override
  Widget build(BuildContext context) {
    switch (_loginStatus){
      case LoginStatus.notSignIn:
    return Scaffold(
      //appBar: AppBar(
      //title: Text('Hi!'),
      //),
      body: Container(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/duitku.png'),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Sign In to Your Account'),
                    SizedBox(width: 5.0),
                  ],
                ),
              ),
              TextFormField(
                validator: (input) => input.trim().isEmpty
                 ? 'Please enter your email'
                 : null,
                onSaved: (input) => user_email = input,
                decoration: InputDecoration(
                    hintText: "e.g.: youremail@domain.com",
                    icon: Icon(Icons.mail),
                    labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
                validator: (input) => input.length < 8
                 ? 'Your password must be 8 characters long'
                 : null,
                onSaved: (input) => user_email = input,
                obscureText: _hidePassword,
                decoration: InputDecoration(
                    hintText: "Enter Your Password",
                    icon: Icon(Icons.lock),
                    labelText: 'Password',
                    suffix: IconButton(
                      onPressed: showPassword,
                      icon: Icon(_hidePassword
                          ? Icons.visibility_off
                          : Icons.visibility),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: RaisedButton(
                  child: Text('Sign In'),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('New to DuitKu?'),
                    SizedBox(width: 5.0),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()));
                      },
                      child: Text('Register Here'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    break;
    case LoginStatus.signIn: 
    return HomePage();
    break;
  }
}
}