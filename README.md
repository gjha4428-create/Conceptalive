# ConceptAlive

A complete, production-ready Flutter application demonstrating best practices in mobile app development. ConceptAlive showcases Clean Architecture, Material 3 design, responsive UI, state management with Provider, and modern Flutter development patterns.

## 📱 Features

- **Clean Architecture**: Well-organized folder structure separating concerns (core, models, services, repositories, providers, screens, widgets)
- **Material 3 Design**: Modern Material 3 UI with custom theming
- **State Management**: Efficient state management using Provider
- **Navigation**: Type-safe routing with GoRouter
- **Responsive Design**: Adaptive UI that works on all screen sizes and orientations
- **Dark & Light Theme**: Complete theme support with system preference detection
- **Null Safety**: 100% null-safe Dart code
- **Error Handling**: Comprehensive error handling throughout the app
- **Localization**: Multi-language support ready (via intl package)
- **Offline Support**: Local storage with SharedPreferences
- **Connectivity Detection**: Network connectivity monitoring
- **Logging**: Structured logging with the logger package

## 📋 Requirements

- Flutter SDK: >= 3.13.0
- Dart SDK: >= 3.0.0
- Android SDK: API level 21+
- iOS: 12.0+
- macOS: 10.14+
- Windows: Windows 10+
- Linux: Any modern distribution

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/conceptalive.git
cd conceptalive
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Generate Code (JSON Serialization)

```bash
flutter pub run build_runner build
```

### 4. Run the Application

#### Android
```bash
flutter run -d android
```

#### iOS
```bash
flutter run -d iphone
```

#### Web
```bash
flutter run -d chrome
```

#### Windows
```bash
flutter run -d windows
```

#### Linux
```bash
flutter run -d linux
```

#### macOS
```bash
flutter run -d macos
```

## 📁 Project Structure

```
lib/
├── core/                    # Core functionality
│   ├── constants/          # App constants
│   ├── errors/             # Error handling
│   ├── extensions/         # Extension methods
│   ├── network/            # Network utilities
│   └── utils/              # Utility functions
├── models/                 # Data models
│   └── entities/           # Entity models
├── services/               # External services
│   ├── api_service.dart    # HTTP client
│   ├── storage_service.dart # Local storage
│   └── connectivity_service.dart # Connectivity
├── repositories/           # Repository pattern
│   └── app_repository.dart # Main repository
├── providers/              # Provider state management
│   ├── app_provider.dart   # App state
│   └── theme_provider.dart # Theme state
├── screens/                # App screens
│   ├── home/              # Home screen
│   ├── settings/          # Settings screen
│   ├── splash/            # Splash screen
│   └── error/             # Error screen
├── widgets/                # Reusable widgets
│   ├── common/            # Common widgets
│   ├── buttons/           # Button widgets
│   └── dialogs/           # Dialog widgets
├── routes/                 # Navigation routes
│   └── app_routes.dart    # Route definitions
├── theme/                  # App theme
│   ├── app_theme.dart     # Theme configuration
│   └── app_colors.dart    # Color palette
├── constants/              # App constants
│   ├── app_strings.dart   # String constants
│   └── app_constants.dart # General constants
├── utils/                  # Utility functions
│   ├── validators.dart    # Input validators
│   └── formatters.dart    # Data formatters
└── main.dart              # Application entry point

assets/
├── images/                # PNG, JPG images
├── icons/                 # SVG and icon assets
├── animations/            # Lottie animations
└── fonts/                 # Custom fonts

test/
└── widget_test.dart       # Widget tests

android/                   # Android platform code
ios/                       # iOS platform code
web/                       # Web platform code
windows/                   # Windows platform code
linux/                     # Linux platform code
macos/                     # macOS platform code
```

## 🎨 Theme System

The app uses Material 3 with a complete light and dark theme system:

- **Primary Color**: Dynamically generated from system/app preference
- **Secondary Colors**: Complementary colors for UI elements
- **Error Color**: For error states and validation messages
- **Surface Colors**: For backgrounds and containers
- **Text Colors**: Accessible contrast ratios

## 🔄 State Management

State is managed using the **Provider** package:

- **AppProvider**: Manages global app state
- **ThemeProvider**: Handles theme switching and persistence
- **Custom Providers**: Feature-specific state management

## 🧭 Navigation

Navigation is handled by **GoRouter**:

- Type-safe route definitions
- Deep linking support
- Nested navigation
- Error handling for unknown routes

## 📡 API Integration

The app includes:

- **APIService**: Centralized HTTP client with error handling
- **Request/Response Interceptors**: For headers and logging
- **Error Handling**: Structured error responses
- **Connectivity Checking**: Before making network requests

## 💾 Local Storage

- **SharedPreferences**: For app settings, user preferences, and simple data persistence
- **Encrypted Storage**: Ready for sensitive data (can be extended)

## 🌐 Localization

The app is prepared for multi-language support using the **intl** package. Add translations to `assets/lang/` and extend the localization configuration.

## ✅ Code Quality

- **Linting**: Configured with `flutter_lints`
- **Analysis**: Run `flutter analyze` to check code quality
- **Testing**: Includes widget tests and setup for unit/integration tests

## 🧪 Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

## 📦 Building for Release

### Android

```bash
flutter build apk --release
# or
flutter build appbundle --release
```

### iOS

```bash
flutter build ios --release
```

### Web

```bash
flutter build web --release
```

### Windows

```bash
flutter build windows --release
```

### Linux

```bash
flutter build linux --release
```

### macOS

```bash
flutter build macos --release
```

## 📚 Dependencies

Key dependencies used:

- **provider**: ^6.4.0 - State management
- **go_router**: ^13.0.0 - Navigation
- **google_fonts**: ^6.2.0 - Font package
- **http**: ^1.1.0 - HTTP client
- **shared_preferences**: ^2.2.3 - Local storage
- **json_annotation**: ^4.8.1 - JSON serialization
- **connectivity_plus**: ^5.0.2 - Connectivity detection
- **logger**: ^2.1.0 - Logging
- **intl**: ^0.19.0 - Internationalization

For dev dependencies:

- **flutter_lints**: ^3.0.0 - Linting rules
- **json_serializable**: ^6.7.1 - JSON code generation
- **build_runner**: ^2.4.6 - Code generation runner

## 🐛 Troubleshooting

### Build Issues

```bash
# Clean build
flutter clean
flutter pub get
flutter pub run build_runner clean
flutter pub run build_runner build
```

### Platform-Specific Issues

**Android**: Ensure Android SDK API 21+ is installed

**iOS**: Run `pod install` in `ios/` directory if needed

**Windows**: Requires Visual Studio 2022 or Build Tools

**Linux**: Install required development packages

## 🤝 Contributing

Contributions are welcome! Please follow the project's code style and architecture patterns.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Author

ConceptAlive - Flutter Application Template

## 🙏 Acknowledgments

- Flutter Team for the amazing framework
- Material Design guidelines
- Community packages and plugins
