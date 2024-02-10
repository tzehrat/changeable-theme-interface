import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData pink = ThemeData(
    buttonTheme: ButtonThemeData(buttonColor: Colors.pink[900]),
    primarySwatch: Colors.pink,
    scaffoldBackgroundColor: Colors.pink.shade100);

ThemeData purple = ThemeData(
    buttonTheme: ButtonThemeData(buttonColor: Colors.purple[200]),
    primarySwatch: Colors.purple,
    scaffoldBackgroundColor: Colors.purple[100]);

class ThemeColorData with ChangeNotifier {
  static late SharedPreferences _sharedPrefObject;

  bool _isPink = false;
  bool get isPink => _isPink;
  ThemeData get themeColor {
    return _isPink ? pink : purple;
  }

  void toggleTheme() {
    _isPink = !_isPink;
    saveThemeToSharedPref(_isPink);
    notifyListeners();
  }

  Future<void> createSharedPrefObject() async {
    _sharedPrefObject = await SharedPreferences.getInstance();
  }

  void saveThemeToSharedPref(bool value) {
    _sharedPrefObject.setBool('themeData', value);
  }

  Future<void> loadThemeFromSharedPref() async {
    // await createSharedPrefObject();
    _isPink = _sharedPrefObject.getBool('themeData') ?? true;
    /*   if (_sharedPrefObject.getBool('themeData') == null) {
      _isPink == true;
    } else {
      _isPink = _sharedPrefObject.getBool('themeData')!;
    }*/
  }
}
