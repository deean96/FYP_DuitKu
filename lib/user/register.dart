import 'dart:convert';

import 'package:flutter/material.dart';

import 'login.dart';

import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  //RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String user_email, user_password, user_name;
  final _key = new GlobalKey<FormState>(); // form validation
  bool _hidePassword = true; //initiate hide password

  //hide
  showPassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      save();
    }
  }

  save() async {
    final response =
        await http.post("http://192.168.43.76:8080/duitku/api/register.php", body: {
      "user_email": user_email,
      "user_password": user_password,
      "user_name": user_name,
    });

    final data = jsonDecode(response.body);
    int value = data['value'];
    String message = data['message'];

    if (value == 1) {
      setState(() {
        Navigator.pop(context);
      });
    } else {
      print(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //disable overflow
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Form(
              key: _key, //form validator
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
                        Text('Register Your Account'),
                        SizedBox(width: 5.0),
                      ],
                    ),
                  ),
                  TextFormField(
                    validator: (input) =>
                        input.trim().isEmpty ? 'Please enter your name' : null,
                    onSaved: (input) => user_name = input,
                    decoration: InputDecoration(
                        hintText: "e.g.: Ali Bin Ahmad",
                        icon: Icon(Icons.person),
                        labelText: 'Name',
                        border: OutlineInputBorder()),
                  ),
                  TextFormField(
                    validator: (input) =>
                        input.trim().isEmpty ? 'Please enter your email' : null,
                    onSaved: (input) => user_email = input,
                    decoration: InputDecoration(
                        hintText: "e.g.: youremail@domain.com",
                        icon: Icon(Icons.mail),
                        labelText: 'Email',
                        border: OutlineInputBorder()),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    obscureText: _hidePassword,
                    validator: (input) => input.length < 8
                        ? 'Your Password Must Be 8 Characters Long'
                        : null,
                    onSaved: (input) => user_password = input,
                    decoration: InputDecoration(
                        hintText: "Enter Your Password",
                        icon: Icon(Icons.lock),
                        labelText: 'Password',
                        border: OutlineInputBorder(),
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
                      child: Text('Register'),
                      onPressed: () {
                        check();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Already have an account?'),
                        SizedBox(width: 5.0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text('Login Here'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
