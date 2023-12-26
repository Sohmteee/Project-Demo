import 'package:flutter/material.dart';

enum ThemeType { light, dark }

class ThemeProvider extends ChangeNotifier {
  ThemeType themeType = ThemeType.dark;

  void toggleTheme() {
    themeType = themeType == ThemeType.light ? ThemeType.dark : ThemeType.light;
    notifyListeners();
  }
}
