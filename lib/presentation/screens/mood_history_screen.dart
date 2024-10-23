import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MoodHistoryScreen extends StatelessWidget {
  final moodBox = Hive.box('moodBox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mood History')),
      body: ValueListenableBuilder(
        valueListenable: moodBox.listenable(),
        builder: (context, Box box, _) {
          if (box.isEmpty) {
            return Center(child: Text('No mood entries yet.'));
          }

          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              final key = box.keyAt(index);
              final mood = box.get(key);
              return ListTile(
                title: Text('$key: $mood'),
              );
            },
          );
        },
      ),
    );
  }
}
