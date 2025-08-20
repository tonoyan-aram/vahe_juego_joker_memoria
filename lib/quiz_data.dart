class Question {
  final String question;
  final List<String> options;
  final String correctAnswer;

  Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

List<Question> quizData = [
  Question(
    question: '1. In Greek mythology, who is the goddess of love, beauty, and desire?',
    options: ['Aphrodite', 'Artemis', 'Persephone', 'Athena'],
    correctAnswer: 'Aphrodite',
  ),
  Question(
    question: '2. In Greek mythology, who is the god of war?',
    options: ['Apollo', 'Hermes', 'Ares', 'Hephaestus'],
    correctAnswer: 'Ares',
  ),
  Question(
    question: '3. In Greek mythology, who is the goddess of the hunt, wilderness, and the moon?',
    options: ['Hera', 'Aphrodite', 'Demeter', 'Artemis'],
    correctAnswer: 'Artemis',
  ),
  Question(
    question: '4. In Greek mythology, who is the god of the sun, music, poetry, and prophecy?',
    options: ['Hermes', 'Apollo', 'Zeus', 'Poseidon'],
    correctAnswer: 'Apollo',
  ),
  Question(
    question: '5. In Greek mythology, who is the goddess of wisdom, courage, and strategic warfare?',
    options: ['Hera', 'Athena', 'Artemis', 'Demeter'],
    correctAnswer: 'Athena',
  ),
  Question(
    question: '6. In Greek mythology, who is the god of the sea, earthquakes, and horses?',
    options: ['Zeus', 'Hermes', 'Apollo', 'Poseidon'],
    correctAnswer: 'Poseidon',
  ),
  Question(
    question: '7. In Greek mythology, who is the queen of the gods and the goddess of marriage and family?',
    options: ['Demeter', 'Hera', 'Athena', 'Aphrodite'],
    correctAnswer: 'Hera',
  ),
  Question(
    question: '8. In Greek mythology, who is the queen of the underworld and the goddess of spring?',
    options: ['Hera', 'Persephone', 'Demeter', 'Artemis'],
    correctAnswer: 'Persephone',
  ),
  Question(
    question: '9. In Greek mythology, who is the king of the gods and the god of the sky, lightning, and thunder?',
    options: ['Apollo', 'Ares', 'Zeus', 'Hermes'],
    correctAnswer: 'Zeus',
  ),
  Question(
    question: '10. In Greek mythology, who is the god of wine, pleasure, and revelry?',
    options: ['Hermes', 'Apollo', 'Zeus', 'Dionysus'],
    correctAnswer: 'Dionysus',
  ),
  Question(
    question: '11. In Greek mythology, who is the goddess of the harvest, agriculture, and fertility?',
    options: ['Hera', 'Demeter', 'Aphrodite', 'Artemis'],
    correctAnswer: 'Demeter',
  ),
  Question(
    question: '12. In Greek mythology, who is the god of travelers, thieves, and the messenger of the gods?',
    options: ['Apollo', 'Hermes', 'Ares', 'Hephaestus'],
    correctAnswer: 'Hermes',
  ),
  Question(
    question: '13. In Greek mythology, who is the god of fire, blacksmiths, and craftsmanship?',
    options: ['Hermes', 'Hephaestus', 'Apollo', 'Ares'],
    correctAnswer: 'Hephaestus',
  ),
];
