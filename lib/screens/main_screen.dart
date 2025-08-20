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
      backgroundColor:
          Colors.transparent, // Ensure no white background shows through
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.orange.shade200, // Lighter orange
              Colors.deepOrangeAccent.shade100, // Slightly darker orange/red
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.spaceAround, // Center content vertically
              crossAxisAlignment: CrossAxisAlignment
                  .stretch, // Ensure content stretches horizontally
              children: [
                // Header
                // SizedBox(height: 50), // marginTop: 50
                Text(
                  'Memory Match',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: theme.text, // Changed back to theme.text
                  ),
                ),
                Text(
                  'Find all the matching pairs!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: theme.text.withOpacity(
                      0.8,
                    ), // Changed back to theme.text
                  ),
                ),
                // Buttons
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildButton(
                        context: context,
                        text: 'Play',
                        backgroundColor: theme.primary,
                        textColor: theme.secondary,
                        // onPressed: () => context.go('/level_selection'),
                        onPressed: () => context.go('/webview'),
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
                        text: 'How to Play',
                        backgroundColor: theme.secondary,
                        textColor: theme.primary,
                        onPressed: () => context.push('/read_more'),
                      ),
                    ],
                  ),
                ),

                // Footer
                Text(
                  'Challenge your memory!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: theme.text, // Changed back to theme.text
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
        ),
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
        shadowColor: Colors.black.withOpacity(
          0.25,
        ), // shadowColor, shadowOffset, shadowOpacity, shadowRadius
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
