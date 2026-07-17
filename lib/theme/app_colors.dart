import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primaryLight = Color(0xFF6366F1);
  static const Color primaryDark = Color(0xFF818CF8);
  static const Color primaryVariant = Color(0xFF4F46E5);

  // Secondary Colors
  static const Color secondaryLight = Color(0xFF10B981);
  static const Color secondaryDark = Color(0xFF34D399);

  // Tertiary Colors
  static const Color tertiaryLight = Color(0xFFF59E0B);
  static const Color tertiaryDark = Color(0xFFFBBF24);

  // Background Colors
  static const Color lightBackground = Color(0xFFF3F4F6);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color darkBackground = Color(0xFF111827);
  static const Color darkSurface = Color(0xFF1F2937);

  // Text Colors
  static const Color darkGrey = Color(0xFF374151);
  static const Color lightGrey = Color(0xFFD1D5DB);
  static const Color mediumGrey = Color(0xFF9CA3AF);

  // State Colors
  static const Color successGreen = Color(0xFF10B981);
  static const Color warningOrange = Color(0xFFF59E0B);
  static const Color errorRed = Color(0xFFEF4444);
  static const Color infoBlue = Color(0xFF3B82F6);

  // Transparent Colors
  static const Color transparent = Color(0x00000000);
  static const Color black50 = Color(0x80000000);

  // Utility method to get color based on brightness
  static Color getPrimaryColor(Brightness brightness) {
    return brightness == Brightness.dark ? primaryDark : primaryLight;
  }

  static Color getSecondaryColor(Brightness brightness) {
    return brightness == Brightness.dark ? secondaryDark : secondaryLight;
  }

  static Color getTertiaryColor(Brightness brightness) {
    return brightness == Brightness.dark ? tertiaryDark : tertiaryLight;
  }
}
