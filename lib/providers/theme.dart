import 'package:flutter/material.dart';

enum ThemeType { light, dark }

class ThemeProvider extends ChangeNotifier {
  ThemeType themeType = ThemeType.light;

  void toggleTheme() {
    themeType = themeType == ThemeType.light ? ThemeType.dark : ThemeType.light;
    notifyListeners();
  }
}
