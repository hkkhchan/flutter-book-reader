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
    return MaterialApp(
      title: 'test',
//      title: Lang.of(context).text('test'),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(auth: Auth()),
//        '/': (context) => TestPage(auth: Auth()),
        '/test': (context) => TestPage(auth: Auth()),
        '/signup': (context) => SignUpPage(auth: Auth()),
        '/login': (context) => LoginPage(auth: Auth()),
        '/forget-password': (context)=> ForgetPasswordPage(auth: Auth())
      },
      localizationsDelegates: [
        const LangDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale.fromSubtags(languageCode: 'tc', scriptCode: 'Hant', countryCode: 'HK')
      ],
    );
  }
}
