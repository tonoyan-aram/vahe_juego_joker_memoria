import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  final List<Map<String, String>> levels = const [
    {"name": "Level 1", "image": "assets/images/Aphrodite.png"},
    {"name": "Level 2", "image": "assets/images/Apollo.png"},
    {"name": "Level 3", "image": "assets/images/Ares.png"},
    {"name": "Level 4", "image": "assets/images/Artemis.png"},
    {"name": "Level 5", "image": "assets/images/Athena.png"},
    {"name": "Level 6", "image": "assets/images/Demeter.png"},
    {"name": "Level 7", "image": "assets/images/Dionysus.png"},
    {"name": "Level 8", "image": "assets/images/Hephaestus.png"},
    {"name": "Level 9", "image": "assets/images/Hera.png"},
    {"name": "Level 10", "image": "assets/images/Hermes.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Level'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          childAspectRatio: 0.8, // Adjust as needed
        ),
        itemCount: levels.length,
        itemBuilder: (context, index) {
          final level = levels[index];
          return GestureDetector(
            onTap: () {
              // Navigate to game screen with level data
              context.go('/game', extra: {'level': index + 1});
            },
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      level['image']!,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      level['name']!,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
