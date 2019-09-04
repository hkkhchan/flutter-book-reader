import 'package:flutter/material.dart';
import 'package:my_app/forget-password-page.dart';
import './login-page.dart';
import './sign-up-page.dart';
import './test-page.dart';
import './forget-password-page.dart';
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
        '/signup': (context) => SignUpPage(auth: Auth()),
        '/login': (context) => LoginPage(auth: Auth()),
        '/forget-password': (context)=> ForgetPasswordPage(auth: Auth())
      },
    );
  }
}
