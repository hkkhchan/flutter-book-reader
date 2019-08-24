import 'package:flutter/material.dart';
import './login.dart';
import './signup.dart';
import './test.dart';

void main() {
  runApp(MaterialApp(
    title: 'Book Reader',
    initialRoute: '/',
    routes: {
      '/': (context) => LoginPage(),
      '/test': (context) => TestPage(),
      '/signup': (context) => SignupPage(),
      '/login': (context) => LoginPage(),
    },
  ));
}
