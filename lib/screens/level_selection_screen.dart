import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  final List<Map<String, dynamic>> levels = const [
    {"name": "Level 1"},
    {"name": "Level 2"},
    {"name": "Level 3"},
    {"name": "Level 4"},
    {"name": "Level 5"},
    {"name": "Level 6"},
    {"name": "Level 7"},
    {"name": "Level 8"},
    {"name": "Level 9"},
    {"name": "Level 10"},
    {"name": "Level 11"},
    {"name": "Level 12"},
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
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blueGrey.shade700, // Static start color
                      Colors.blueGrey.shade900, // Static end color
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/bg.png',
                        fit: BoxFit.contain, // Adjust fit as needed
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        level['name']!,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
