import 'package:flutter/material.dart';
import 'dart:math' as math;

class MemoryCard extends StatefulWidget {
  final String imagePath;
  final bool isFlipped;
  final bool isMatched;
  final VoidCallback onTap;

  const MemoryCard({
    super.key,
    required this.imagePath,
    required this.isFlipped,
    required this.isMatched,
    required this.onTap,
  });

  @override
  State<MemoryCard> createState() => _MemoryCardState();
}

class _MemoryCardState extends State<MemoryCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 400), // Длительность анимации
        transitionBuilder: (Widget child, Animation<double> animation) {
          final rotate = Tween(begin: 0.0, end: 1.0).animate(animation);
          return AnimatedBuilder(
            animation: rotate,
            child: child,
            builder: (BuildContext context, Widget? child) {
              final angle = rotate.value * math.pi; // От 0 до pi (180 градусов)
              // Определяем, какую сторону показывать, чтобы анимация была правильной
              final isFrontVisible = angle <= math.pi / 2;

              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001) // Перспектива
                  ..rotateY(isFrontVisible ? angle : angle + math.pi), // Поворот для отображения нужной стороны
                child: isFrontVisible ? child : Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateY(math.pi), // Дополнительный поворот для обратной стороны
                  child: child,
                ), // Отображаем дочерний виджет (лицо или рубашку)
              );
            },
          );
        },
        child: (widget.isFlipped || widget.isMatched) // isFlipped - это состояние, которое контролирует, какая сторона должна быть показана
            ? _buildFront() // Если isFlipped true, показываем лицевую сторону
            : _buildBack(), // Если isFlipped false, показываем рубашку
      ),
    );
  }

  Widget _buildFront() {
    return Card(
      key: const ValueKey<bool>(true), // Ключ для AnimatedSwitcher
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Image.asset(
        widget.imagePath,
        fit: BoxFit.contain,
        width: 80,
        height: 80,
      ),
    );
  }

  Widget _buildBack() {
    return Card(
      key: const ValueKey<bool>(false), // Ключ для AnimatedSwitcher
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Image.asset(
        'assets/images/card_back.png',
        fit: BoxFit.contain,
        width: 80,
        height: 80,
      ),
    );
  }
}
