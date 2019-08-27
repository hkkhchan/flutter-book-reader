import 'package:flutter/material.dart';
import 'package:my_app/forget-password.dart';
import './login.dart';
import './signup.dart';
import './test.dart';
import './forget-password.dart';
import 'auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override Widget build(BuildContext context){
    return MaterialApp(
      title: 'Book Reader',
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(auth: Auth()),
        '/test': (context) => TestPage(),
        '/signup': (context) => SignupPage(auth: Auth()),
        '/login': (context) => LoginPage(auth: Auth()),
        '/forget-password': (context)=> ForgetPasswordPage(auth: Auth())
      },
    );
  }
}
