import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';
import 'package:go_router/go_router.dart'; // Import go_router to use context.pop()

class ReadMoreScreen extends StatelessWidget {
  const ReadMoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.currentTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('How to Play Memory Match'),
        backgroundColor: theme.primary,
        foregroundColor: theme.secondary,
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
          // image: const DecorationImage(
          //   image: AssetImage('assets/images/cr1.png'), // Use a suitable background image
          //   fit: BoxFit.cover,
          // ),
          // color: theme.background.withOpacity(0.7),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Game Rules',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: theme.text,
                ),
              ),
              const SizedBox(height: 20),
              _buildRuleSection(theme, 'Goal', 'The goal of Memory Match is to find all matching pairs of cards on the board.'),
              _buildRuleSection(theme, 'How to Play', 'Tap on any card to flip it over and reveal the image on its face. Then, tap on a second card to flip it over as well.'),
              _buildRuleSection(theme, 'Matching Pairs', 'If the two cards you flipped have the same image, they form a matching pair! These cards will stay face-up and are removed from play.'),
              _buildRuleSection(theme, 'No Match', 'If the two cards do not match, they will automatically flip back over after a short delay. Try to remember their positions for future turns!'),
              _buildRuleSection(theme, 'Turns and Moves', 'Each time you flip two cards (whether they match or not) counts as one move. Try to find all pairs in the fewest moves possible!'),
              _buildRuleSection(theme, 'Winning', 'The game ends when all pairs have been found. Your score is based on the number of moves you took. Good luck!'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRuleSection(AppTheme theme, String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: theme.primary,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: theme.text.withOpacity(0.9),
            ),
          ),
        ],
      ),
    );
  }
}
