import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController with ChangeNotifier {
  Locale? appLocale;
  Locale? get apppLocale => appLocale;

  void changeLanguage(Locale type) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    appLocale = type;
    if (type == Locale('en')) {
      await sp.setString('language_code', 'en');
    } else if (type == Locale('es')) {
      await sp.setString('language_code', 'es');
    } else if (type == Locale('tr')) {
      await sp.setString('language_code', 'tr');
    } else if (type == Locale('ur')) {
      await sp.setString('language_code', 'ur');
    }
//hi hello
//hi hello
    notifyListeners();
  }
}
