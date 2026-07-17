import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  bool get isMobile => MediaQuery.of(this).size.width < 600;
  bool get isTablet => MediaQuery.of(this).size.width >= 600 && MediaQuery.of(this).size.width < 900;
  bool get isDesktop => MediaQuery.of(this).size.width >= 900;

  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  EdgeInsets get padding => MediaQuery.of(this).padding;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  ThemeData get theme => Theme.of(this);

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  void showSnackBar(String message, {Duration duration = const Duration(seconds: 2)}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
      ),
    );
  }

  Future<T?> pushNamed<T>(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }

  void pop<T>({T? result}) {
    Navigator.of(this).pop<T>(result);
  }
}
