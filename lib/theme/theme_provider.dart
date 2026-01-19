import "package:flutter/material.dart";
import "package:shared_preferences/shared_preferences.dart";

class ThemeProvider with ChangeNotifier {
  bool _isDark = false;

  ThemeProvider() {
    _loadTheme();
  }

  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    notifyListeners();
    _saveTheme();
  }

  void _loadTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDark = prefs.getBool('isDarkTheme') ?? false;
    notifyListeners();
  }

  void _saveTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', _isDark);
  }
}
