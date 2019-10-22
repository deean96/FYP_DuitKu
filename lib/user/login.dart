import 'package:duitku/user/register.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                  child: Text('Sign In'),
                  onPressed: () {},
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
  }
}
