import 'package:flutter/material.dart';

class AppTheme {
  final Color primary;
  final Color secondary;
  final Color background;
  final Color text;
  final Color accent;
  final Color success;
  final Color error;
  final Color warning;

  AppTheme({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.text,
    required this.accent,
    required this.success,
    required this.error,
    required this.warning,
  });
}

AppTheme lightTheme = AppTheme(
  primary: Color(0xFF8B4513), // Brown - Zeus's throne
  secondary: Color(0xFFDAA520), // Goldenrod - Zeus's lightning
  background: Color(0xFFF5F5DC), // Beige - Ancient parchment
  text: Color(0xFF2F2F2F), // Dark gray
  accent: Color(0xFFCD853F), // Peru - Earth tones
  success: Color(0xFF228B22), // Forest green
  error: Color(0xFFDC143C), // Crimson
  warning: Color(0xFFFF8C00), // Dark orange
);

AppTheme darkTheme = AppTheme(
  primary: Color(0xFFDAA520), // Goldenrod
  secondary: Color(0xFF8B4513), // Brown
  background: Color(0xFF2F2F2F), // Dark gray
  text: Color(0xFFF5F5DC), // Beige
  accent: Color(0xFFCD853F), // Peru
  success: Color(0xFF32CD32), // Lime green
  error: Color(0xFFFF6347), // Tomato
  warning: Color(0xFFFFA500), // Orange
);

class ThemeProvider extends ChangeNotifier {
  late AppTheme _currentTheme;
  bool _isDark = false;

  ThemeProvider() {
    _currentTheme = lightTheme;
  }

  AppTheme get currentTheme => _currentTheme;
  bool get isDark => _isDark;

  void toggleTheme() {
    _isDark = !_isDark;
    _currentTheme = _isDark ? darkTheme : lightTheme;
    notifyListeners();
  }
}
