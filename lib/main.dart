

import 'package:emotiontrackerapp/app.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();  // Initialize Hive for local storage
  await Hive.openBox('moodBox');  // Open a box to store moods
  runApp(App());
}