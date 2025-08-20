import 'package:flutter/material.dart';

class LoadingDotsIndicator extends StatefulWidget {
  const LoadingDotsIndicator({super.key});

  @override
  State<LoadingDotsIndicator> createState() => _LoadingDotsIndicatorState();
}

class _LoadingDotsIndicatorState extends State<LoadingDotsIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..repeat();

    _animation1 = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.6, curve: Curves.easeOut),
    ));
    _animation2 = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.2, 0.8, curve: Curves.easeOut),
    ));
    _animation3 = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Opacity(
          opacity: 1.0 - animation.value, // Fade out effect
          child: Transform.translate(
            offset: Offset(0, -20 * animation.value), // Move up effect
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.white, // Цвет точек
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(_animation1),
        const SizedBox(width: 10),
        _buildDot(_animation2),
        const SizedBox(width: 10),
        _buildDot(_animation3),
      ],
    );
  }
}
