import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themeKey = 'app_theme_mode';
  late ThemeMode _themeMode;
  late SharedPreferences _prefs;
  bool _isInitialized = false;

  ThemeMode get themeMode => _themeMode;
  bool get isInitialized => _isInitialized;

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
      } else {
        _themeMode = ThemeMode.system;
      }
    } catch (e) {
      debugPrint('Error initializing theme: $e');
      _themeMode = ThemeMode.system;
    }
    _isInitialized = true;
    notifyListeners();
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    if (_themeMode == mode) return;
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
    if (_themeMode == ThemeMode.dark) return true;
    if (_themeMode == ThemeMode.light) return false;
    return View.of(WidgetsBinding.instance.rootElement!).platformDispatcher.platformBrightness == Brightness.dark;
  }
}
