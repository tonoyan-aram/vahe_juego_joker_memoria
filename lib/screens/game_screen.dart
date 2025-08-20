import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'dart:async'; // For Timer
import '../theme_provider.dart';
import '../quiz_data.dart';
import '../widgets/memory_card.dart'; // Import the new MemoryCard widget

class GameScreen extends StatefulWidget {
  final int level;
  const GameScreen({super.key, required this.level});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  List<String> _cardImages = [];
  List<bool> _cardFlipped = [];
  List<int> _matchedPairs = [];
  int? _firstFlippedIndex;
  int? _secondFlippedIndex;
  bool _isProcessing = false;
  int _moves = 0;
  int _pairsFound = 0;
  bool _gameOver = false;

  // Removed animation controllers

  int _getCrossAxisCount(int totalCards) {
    if (totalCards == 12) return 4; // 3x4 grid
    if (totalCards == 16) return 4; // 4x4 grid
    if (totalCards == 20) return 4; // 4x5 grid
    if (totalCards == 24) return 4; // 4x6 grid
    return 3; // Default or fallback
  }

  final List<String> _allCardImages = [
    'assets/images/cr1.png',
    'assets/images/cr2.png',
    'assets/images/cr3.png',
    'assets/images/cr4.png',
    'assets/images/cr5.png',
    'assets/images/cr6.png',
    // 'assets/images/Aphrodite.png',
    // 'assets/images/Apollo.png',
    // 'assets/images/Ares.png',
    // 'assets/images/Artemis.png',
    // 'assets/images/Athena.png',
    // 'assets/images/Demeter.png',
    // 'assets/images/Dionysus.png',
    // 'assets/images/Hephaestus.png',
    // 'assets/images/Hera.png',
    // 'assets/images/Hermes.png',
    // 'assets/images/Persephone.png',
    // 'assets/images/Poseidon.png',
    // 'assets/images/Zeus.png',
  ];

  @override
  void initState() {
    super.initState();
    _initializeGame(widget.level);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _initializeGame(int level) {
    _cardImages = [];
    _cardFlipped = [];
    _matchedPairs = [];
    _firstFlippedIndex = null;
    _secondFlippedIndex = null;
    _isProcessing = false;
    _moves = 0;
    _pairsFound = 0;
    _gameOver = false;

    // Determine number of pairs based on level
    int numberOfPairs;
    if (level >= 1 && level <= 2) {
      numberOfPairs = 6; // 12 cards total for 3x4 grid
    } else if (level >= 3 && level <= 5) {
      numberOfPairs = 8; // 16 cards total for 4x4 grid
    } else if (level >= 6 && level <= 8) {
      numberOfPairs = 10; // 20 cards total for 4x5 grid
    } else {
      numberOfPairs = 12; // 24 cards total for 4x6 grid (Levels 9-10)
    }

    List<String> selectedImages = (_allCardImages.toList()..shuffle()).sublist(
      0,
      numberOfPairs,
    );
    _cardImages.addAll(selectedImages);
    _cardImages.addAll(selectedImages); // Duplicate for pairs
    _cardImages.shuffle();

    _cardFlipped = List.generate(_cardImages.length, (index) => false);
    setState(() {});
  }

  void _handleCardTap(int index) {
    if (_isProcessing || _cardFlipped[index] || _matchedPairs.contains(index)) {
      return;
    }

    setState(() {
      _cardFlipped[index] = true;

      if (_firstFlippedIndex == null) {
        _firstFlippedIndex = index;
      } else {
        _secondFlippedIndex = index;
        _isProcessing = true;
        _moves++;

        if (_cardImages[_firstFlippedIndex!] ==
            _cardImages[_secondFlippedIndex!]) {
          // Match found
          _matchedPairs.add(_firstFlippedIndex!);
          _matchedPairs.add(_secondFlippedIndex!);
          _pairsFound++;
          _firstFlippedIndex = null;
          _secondFlippedIndex = null;
          _isProcessing = false;

          if (_pairsFound == _cardImages.length / 2) {
            _gameOver = true;
          }
        } else {
          // No match, flip back after a delay
          Future.delayed(const Duration(milliseconds: 1000), () {
            setState(() {
              _cardFlipped[_firstFlippedIndex!] = false;
              _cardFlipped[_secondFlippedIndex!] = false;
              _firstFlippedIndex = null;
              _secondFlippedIndex = null;
              _isProcessing = false;
            });
          });
        }
      }
    });
  }

  void _handleRestart() {
    _initializeGame(widget.level);
  }

  void _handleBackToLevelSelection() {
    context.go('/level_selection'); // Navigate back to the LevelSelectionScreen
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final theme = themeProvider.currentTheme;

    if (_gameOver) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.lightGreen.shade200, // Lighter vibrant green
                Colors.teal.shade400, // Deeper vibrant teal
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Level Completed!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: theme.text,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Moves: $_moves',
                    style: TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: theme.primary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Pairs Found: $_pairsFound',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: theme.secondary,
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _handleRestart,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.primary,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Play Again',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: theme.secondary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: _handleBackToLevelSelection,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.accent,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Back to Levels',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: theme.background,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Matching Pairs - Level ${widget.level}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _handleBackToLevelSelection,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightGreen, // Start color for the main game screen
              Colors.tealAccent, // End color for the main game screen
            ],
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Moves: $_moves',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: theme.text,
                    ),
                  ),
                  Text(
                    'Pairs Found: $_pairsFound',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: theme.primary,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _getCrossAxisCount(_cardImages.length),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio:
                        0.7, // Делаем карточки прямоугольными (выше, чем шире)
                  ),
                  shrinkWrap:
                      true, // Позволяет GridView занимать только необходимое пространство
                  physics:
                      const NeverScrollableScrollPhysics(), // Отключает прокрутку
                  itemCount: _cardImages.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => _handleCardTap(index),
                      child: MemoryCard(
                        imagePath: _cardImages[index],
                        isFlipped: _cardFlipped[index],
                        isMatched: _matchedPairs.contains(index),
                        onTap: () => _handleCardTap(index),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
