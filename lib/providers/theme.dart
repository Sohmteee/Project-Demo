import 'package:flutter/material.dart';

enum ThemeType { light, dark }

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  void toggleTheme(bool isLightTheme) {
    themeMode = isLightTheme ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}
