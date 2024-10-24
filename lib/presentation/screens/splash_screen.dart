import 'dart:async';
import 'package:flutter/material.dart';
import 'package:emotiontrackerapp/presentation/screens/onboarding_screen.dart'; // Import the onboarding screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Define the list of colors to cycle through
  final List<Color> emotionColors = [
    Colors.pinkAccent, // Happiness
    Colors.blueAccent, // Calm/Sadness
    Colors.yellowAccent, // Excitement
    Colors.deepOrangeAccent, // Anger
    Colors.greenAccent, // Peaceful
  ];

  // Current background color
  Color _currentColor = Colors.pinkAccent;
  int _currentColorIndex = 0;
  Timer? _timer; // Store the timer so we can cancel it

  @override
  void initState() {
    super.initState();

    //background color animation
    _startBackgroundAnimation();

    // Set a delay to navigate to the next screen (OnboardingScreen)
    _timer = Timer(Duration(seconds: 5), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => OnboardingScreen()),
        );
      }
    });
  }

  // Method to cycle through the list of colors
  void _startBackgroundAnimation() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _currentColorIndex = (_currentColorIndex + 1) % emotionColors.length;
          _currentColor = emotionColors[_currentColorIndex];
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1), // Duration of the color transition
        color: _currentColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
           
              Text(
                'Emotion Tracker',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
