import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themeKey = 'app_theme_mode';
  late ThemeMode _themeMode;
  late SharedPreferences _prefs;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    _themeMode = ThemeMode.system;
    _initializeTheme();
  }

  Future<void> _initializeTheme() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      final savedTheme = _prefs.getString(_themeKey);
      if (savedTheme != null) {
        _themeMode = ThemeMode.values.byName(savedTheme);
      }
    } catch (e) {
      debugPrint('Error initializing theme: $e');
      _themeMode = ThemeMode.system;
    }
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    _themeMode = mode;
    try {
      _prefs = await SharedPreferences.getInstance();
      await _prefs.setString(_themeKey, mode.name);
    } catch (e) {
      debugPrint('Error saving theme mode: $e');
    }
    notifyListeners();
  }

  void toggleTheme() {
    final newMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    setThemeMode(newMode);
  }

  bool get isDarkMode {
    return _themeMode == ThemeMode.dark ||
        (_themeMode == ThemeMode.system && _isSystemDarkMode);
  }

  bool get _isSystemDarkMode {
    return WidgetsBinding.instance.window.platformDispatcher.views.first.platformDispatcher.views.isNotEmpty;
  }
}
