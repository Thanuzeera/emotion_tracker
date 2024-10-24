import 'package:emotiontrackerapp/presentation/screens/mood_history_screen.dart';
import 'package:emotiontrackerapp/presentation/screens/mood_screen.dart';
import 'package:emotiontrackerapp/presentation/screens/mood_sttatistics_screen.dart';
import 'package:emotiontrackerapp/presentation/screens/onboarding_screen.dart';
import 'package:emotiontrackerapp/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) =>  SplashScreen(),
  '/onbording': (BuildContext context) => MoodScreen(),
  '/home' : (BuildContext context) => OnboardingScreen(),
  '/mood-list': (BuildContext context) => MoodHistoryScreen(),
  '/mood-statics': (BuildContext context) => MoodStatisticsScreen(),
};