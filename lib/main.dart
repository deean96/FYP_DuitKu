import 'package:duitku/user/login.dart';
import 'package:flutter/material.dart';

void main() => runApp(DuitKu());

class DuitKu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      theme: ThemeData.dark(),
      home: LoginPage(),
    );
  }
}
