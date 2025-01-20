import 'package:flutter/material.dart';

class ThemeLogic extends ChangeNotifier{
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;

  void ThemeSystem(){
    _mode = ThemeMode.system;
    notifyListeners();
  }
  void ThemeLight(){
    _mode = ThemeMode.light;
    notifyListeners();
  }
  void ThemeDark(){
    _mode = ThemeMode.dark;
    notifyListeners();
  }
}