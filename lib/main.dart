import 'package:flutter/material.dart';
import 'package:my_app/forget-password-page.dart';
import './login-page.dart';
import './sign-up-page.dart';
import './test-page.dart';
import './forget-password-page.dart';
import 'auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'lang.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override Widget build(BuildContext context){
    Auth auth = Auth();
    return MaterialApp(
      title: 'test',
//      title: Lang.of(context).text('test'),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(auth: auth),
//        '/': (context) => TestPage(auth: Auth()),
        '/test': (context) => TestPage(auth: auth),
        '/signup': (context) => SignUpPage(auth: auth),
        '/login': (context) => LoginPage(auth: auth),
        '/forget-password': (context)=> ForgetPasswordPage(auth: auth)
      },
      locale: Locale.fromSubtags(languageCode: 'zh'),
      localizationsDelegates: [
        const LangDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale.fromSubtags(languageCode: 'zh'),
        const Locale('en')
      ],
    );
  }
}
