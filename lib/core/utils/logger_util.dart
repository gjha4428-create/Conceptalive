import 'package:flutter/material.dart';

class LoggerUtil {
  static bool _initialized = false;

  static void initialize() {
    if (_initialized) return;
    _initialized = true;
    debugPrint('🔧 Logger initialized');
  }

  static void debug(String message) {
    debugPrint('🐛 DEBUG: $message');
  }

  static void info(String message) {
    debugPrint('ℹ️ INFO: $message');
  }

  static void warning(String message) {
    debugPrint('⚠️ WARNING: $message');
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    debugPrint('❌ ERROR: $message');
    if (error != null) {
      debugPrint('Error: $error');
    }
    if (stackTrace != null) {
      debugPrint('StackTrace: $stackTrace');
    }
  }
}
