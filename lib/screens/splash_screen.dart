import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';
import '../widgets/loading_dots_indicator.dart'; // Import the new indicator

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {}); // Simulate loading
    if (mounted) {
      context.go('/main'); // Navigate to the main screen (which will be the old main_screen.dart)
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/phone1.png'), // Using a suitable background image
            fit: BoxFit.cover,
          ),
        ),
        child: Stack( // Use Stack to layer the image and overlay
          children: [
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.5), // Adjust opacity as needed
              ),
            ),
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LoadingDotsIndicator(), // Use the new loading indicator
                  // Removed Text('Loading...'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
