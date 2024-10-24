import 'package:emotiontrackerapp/constants/routes.dart';
import 'package:flutter/material.dart';



class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
       // home: OnboardingScreen(),
       title: 'EmotionTracker',
       initialRoute: '/',
       routes: routes,
    );
  }
}