import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';
import 'package:go_router/go_router.dart'; // Import go_router to use context.pop()

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  void _showAboutDialog(BuildContext context, AppTheme theme) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: theme.background,
          title: Text(
            'About Zeus Quiz Competition',
            style: TextStyle(color: theme.text),
          ),
          content: Text(
            'Test your knowledge of Greek mythology with this interactive quiz app. Learn about the gods, goddesses, and heroes of ancient Greece while having fun!',
            style: TextStyle(color: theme.text),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text('OK', style: TextStyle(color: theme.primary)),
            ),
          ],
        );
      },
    );
  }

  void _showHelpDialog(BuildContext context, AppTheme theme) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: theme.background,
          title: Text(
            'How to Play',
            style: TextStyle(color: theme.text),
          ),
          content: Text(
            '1. Tap "Start Quiz" to begin\n2. Read each question carefully\n3. Select the correct answer from the options\n4. See your score and feedback\n5. Try to achieve the highest score possible!',
            style: TextStyle(color: theme.text),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                context.pop();
              },
              child: Text('Got it!', style: TextStyle(color: theme.primary)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.currentTheme;
    final isDark = themeProvider.isDark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              theme.background,
              theme.background.withOpacity(0.8),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Overlay for background color (React Native's backgroundColor style)
            // Positioned.fill(
            //   child: Container(
            //     color: theme.background.withOpacity(0.7), // Adjust opacity as needed to blend with image
            //   ),
            // ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Header
                    const SizedBox(height: 30), // marginTop: 30
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: theme.text,
                      ),
                    ),
                    const SizedBox(height: 10), // marginBottom: 10
                    Text(
                      'Customize your quiz experience',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: theme.text.withOpacity(0.8),
                      ),
                    ),
                    const SizedBox(height: 40), // marginBottom: 40

                    // Settings Container
                    Expanded(
                      child: Column(
                        children: [
                          // Dark Mode Switch
                          _buildSettingItem(
                            context: context,
                            backgroundColor: theme.accent,
                            label: 'Dark Mode',
                            description: 'Switch between light and dark themes',
                            labelColor: theme.background,
                            descriptionColor: theme.background,
                            trailingWidget: Switch(
                              value: isDark,
                              onChanged: (value) => themeProvider.toggleTheme(),
                              activeColor: theme.secondary, // thumbColor when true
                              inactiveThumbColor: theme.secondary, // thumbColor when false
                              activeTrackColor: theme.primary, // trackColor when true
                              inactiveTrackColor: theme.primary, // trackColor when false
                            ),
                          ),
                          const SizedBox(height: 20), // gap: 20

                          // About Button
                          _buildSettingItem(
                            context: context,
                            backgroundColor: theme.primary,
                            label: 'About',
                            description: 'Learn more about the app',
                            labelColor: theme.secondary,
                            descriptionColor: theme.secondary,
                            onTap: () => _showAboutDialog(context, theme),
                            trailingWidget: Icon(
                              Icons.arrow_forward_ios,
                              color: theme.secondary,
                              size: 16,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // How to Play Button
                          _buildSettingItem(
                            context: context,
                            backgroundColor: theme.secondary,
                            label: 'How to Play',
                            description: 'Get help and instructions',
                            labelColor: theme.primary,
                            descriptionColor: theme.primary,
                            onTap: () => _showHelpDialog(context, theme),
                            trailingWidget: Icon(
                              Icons.arrow_forward_ios,
                              color: theme.primary,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Footer
                    const SizedBox(height: 30), // marginBottom: 30
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
      ),
    );
  }

  Widget _buildSettingItem({
    required BuildContext context,
    required Color backgroundColor,
    required String label,
    required String description,
    required Color labelColor,
    required Color descriptionColor,
    Widget? trailingWidget,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: labelColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: descriptionColor.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
            if (trailingWidget != null) trailingWidget,
          ],
        ),
      ),
    );
  }
}
