import 'package:chatappv2/themes/dark_mode.dart';
import 'package:flutter/material.dart';
import 'package:chatappv2/themes/light_mode.dart';
class ThemeProvider extends ChangeNotifier{
  ThemeData _themeData = lightmode;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkmode;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void ToggleTheme(){
    if(_themeData == lightmode){
      themeData=darkmode;
    }else{
      themeData=lightmode;
    }
  }
}