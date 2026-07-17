class AppConstants {
  // API
  static const String apiBaseUrl = 'https://api.example.com';
  static const int apiTimeout = 30;
  static const int apiRetries = 3;

  // Storage
  static const String storageKeyUser = 'user';
  static const String storageKeySettings = 'settings';
  static const String storageKeyTheme = 'theme';

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Delays
  static const int splashDelay = 2000; // milliseconds
  static const int debounceDelay = 500; // milliseconds
  static const int refreshDelay = 1000; // milliseconds

  // Validation
  static const int minPasswordLength = 6;
  static const int maxPasswordLength = 128;
  static const int minNameLength = 2;
  static const int maxNameLength = 100;

  // UI
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 12.0;
  static const double borderRadiusXLarge = 16.0;

  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;

  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double iconSizeXLarge = 48.0;

  // Responsive
  static const double mobileBreakpoint = 600.0;
  static const double tabletBreakpoint = 900.0;
  static const double desktopBreakpoint = 1200.0;
}
