import 'package:flutter/material.dart';

import 'login.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _hidePassword = true;

  //hide
  showPassword() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Text('Register Your Account'),
                    SizedBox(width: 5.0),
                  ],
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "e.g.: Ali Bin Ahmad",
                    icon: Icon(Icons.person),
                    labelText: 'Name'),
              ),
              TextFormField(
                decoration: InputDecoration(
                    hintText: "e.g.: youremail@domain.com",
                    icon: Icon(Icons.mail),
                    labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextFormField(
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
                  child: Text('Register'),
                  onPressed: () {},
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
    );
  }
}
