import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Lang {
  Lang(Locale locale) {
    this.locale = locale;
    _localizedValues = null;
  }

  Locale locale;
  static Map<dynamic, dynamic> _localizedValues;

  static Lang of(BuildContext context){
    return Localizations.of<Lang>(context, Lang);
  }

  String text(String key) {
    return _localizedValues[key] ?? '** $key not found';
  }

  static Future<Lang> load(Locale locale) async {
    Lang lang = new Lang(locale);
    String jsonContent = await rootBundle.loadString("lang/${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);
    return lang;
  }

  get currentLanguage => locale.languageCode;
}

class LangDelegate extends LocalizationsDelegate<Lang> {
  const LangDelegate();

  @override
  bool isSupported(Locale locale) => ['en','fr'].contains(locale.languageCode);

  @override
  Future<Lang> load(Locale locale) => Lang.load(locale);

  @override
  bool shouldReload(LangDelegate old) => false;
}