import 'package:chatappv2/themes/dark_mode.dart';
import 'package:chatappv2/themes/light_mode.dart';
import 'package:flutter/material.dart';

class Themeprovider extends ChangeNotifier {
  ThemeData _themeData = lightmode;

  ThemeData get themedata => _themeData;
  bool get isDarkMode => _themeData == darkmode;
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightmode) {
      themeData = darkmode;
    } else {
      themeData = lightmode;
    }
  }
}
