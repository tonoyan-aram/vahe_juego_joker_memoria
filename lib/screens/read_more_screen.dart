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
        title: const Text('Learn More About Greek Gods'),
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
          image: const DecorationImage(
            image: AssetImage('assets/images/phone2.png'), // Use a suitable background image
            fit: BoxFit.cover,
          ),
          color: theme.background.withOpacity(0.7),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'The Pantheon of Olympus',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: theme.text,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Ancient Greek mythology is a vast and fascinating collection of myths and legends belonging to the ancient Greeks concerning their gods and heroes, the nature of the world, and the origins and significance of their own cult and ritual practices. It was a part of the religion in ancient Greece.',
                style: TextStyle(
                  fontSize: 16,
                  color: theme.text.withOpacity(0.9),
                ),
              ),
              const SizedBox(height: 30),
              _buildGodSection(theme, 'Zeus', 'King of the Gods, ruler of Mount Olympus, and god of the sky, lightning, thunder, law, order, and justice.', 'assets/images/Zeus.png'),
              _buildGodSection(theme, 'Hera', 'Queen of the Gods and the goddess of marriage, women, childbirth, and family. She is Zeus\'s wife and sister.', 'assets/images/Hera.png'),
              _buildGodSection(theme, 'Poseidon', 'God of the sea, earthquakes, storms, and horses. He is a brother of Zeus.', 'assets/images/Poseidon.png'),
              _buildGodSection(theme, 'Demeter', 'Goddess of the harvest, agriculture, fertility, and sacred law. She is a sister of Zeus.', 'assets/images/Demeter.png'),
              _buildGodSection(theme, 'Athena', 'Goddess of wisdom, handicraft, and warfare. She was born from Zeus\'s head.', 'assets/images/Athena.png'),
              _buildGodSection(theme, 'Apollo', 'God of music, poetry, art, oracles, archery, plague, medicine, sun, light, and knowledge. He is the twin brother of Artemis.', 'assets/images/Apollo.png'),
              _buildGodSection(theme, 'Artemis', 'Goddess of the hunt, wilderness, wild animals, the Moon, and chastity. She is the twin sister of Apollo.', 'assets/images/Artemis.png'),
              _buildGodSection(theme, 'Ares', 'God of war. He is the son of Zeus and Hera.', 'assets/images/Ares.png'),
              _buildGodSection(theme, 'Aphrodite', 'Goddess of love, beauty, pleasure, and procreation. She was born from the sea foam.', 'assets/images/Aphrodite.png'),
              _buildGodSection(theme, 'Hephaestus', 'God of blacksmiths, craftsmen, artisans, sculptors, metals, metallurgy, fire, and volcanoes. He is the son of Hera.', 'assets/images/Hephaestus.png'),
              _buildGodSection(theme, 'Dionysus', 'God of wine, fertility, revelry, and ecstasy. He is the youngest of the Olympian gods.', 'assets/images/Dionysus.png'),
              _buildGodSection(theme, 'Hermes', 'Messenger of the gods; god of trade, thieves, travelers, sports, athletes, and border crossings. He is the son of Zeus.', 'assets/images/Hermes.png'),
              _buildGodSection(theme, 'Persephone', 'Goddess of spring and queen of the underworld. She is the daughter of Demeter and Zeus.', 'assets/images/Persephone.png'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGodSection(AppTheme theme, String name, String description, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, width: 80, height: 80, fit: BoxFit.contain),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
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
                    fontSize: 14,
                    color: theme.text.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
