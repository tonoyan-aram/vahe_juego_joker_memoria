import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.currentTheme;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/phone3.png',
              fit: BoxFit.cover,
            ),
          ),
          // Overlay for background color (React Native's backgroundColor style)
          Positioned.fill(
            child: Container(
              color: theme.background.withOpacity(0.7), // Adjust opacity as needed to blend with image
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  // Header
                  SizedBox(height: 50), // marginTop: 50
                  Text(
                    'Zeus Quiz Competition',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: theme.text,
                    ),
                  ),
                  SizedBox(height: 10), // marginBottom: 10
                  Text(
                    'Test Your Knowledge of Greek Mythology',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: theme.text.withOpacity(0.8),
                    ),
                  ),
                  SizedBox(height: 30), // marginBottom: 30

                  // Buttons
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 80), // paddingTop: 80
                        _buildButton(
                          context: context,
                          text: 'Start Quiz',
                          backgroundColor: theme.primary,
                          textColor: theme.secondary,
                          onPressed: () => context.go('/level_selection'),
                        ),
                        SizedBox(height: 20), // gap: 20
                        _buildButton(
                          context: context,
                          text: 'Settings',
                          backgroundColor: theme.accent,
                          textColor: theme.background,
                          onPressed: () => context.push('/settings'),
                        ),
                        SizedBox(height: 20),
                        _buildButton(
                          context: context,
                          text: 'Learn More',
                          backgroundColor: theme.secondary,
                          textColor: theme.primary,
                          onPressed: () => context.push('/read_more'),
                        ),
                      ],
                    ),
                  ),

                  // Footer
                  SizedBox(height: 30), // marginBottom: 30
                  Text(
                    'May the wisdom of the gods guide you!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: theme.text,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required BuildContext context,
    required String text,
    required Color backgroundColor,
    required Color textColor,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
        shadowColor: Colors.black.withOpacity(0.25), // shadowColor, shadowOffset, shadowOpacity, shadowRadius
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
