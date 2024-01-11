import 'package:flutter/material.dart';

/// The ThemeType enum defines the possible theme types in the app.
/// It has two possible values: light and dark.
enum ThemeType { light, dark }

/// ThemeProvider is a [ChangeNotifier] that manages the app theme state.
/// It contains the current [ThemeType] and a [toggleTheme] method to switch between light and dark mode.
class ThemeProvider extends ChangeNotifier {
  /// The current theme type for the app. Defaults to light theme.
  ThemeType themeType = ThemeType.light;

  /// Toggles the theme between light and dark mode.
  ///
  /// Updates the [themeType] to the opposite theme, and notifies
  /// listeners of the change.
  void toggleTheme() {
    themeType = themeType == ThemeType.light ? ThemeType.dark : ThemeType.light;
    notifyListeners();
  }
}
