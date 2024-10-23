import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:hive/hive.dart';

class MoodStatisticsScreen extends StatelessWidget {
  final moodBox = Hive.box('moodBox');

  @override
  Widget build(BuildContext context) {
    final moodFrequency = _calculateMoodFrequency();

    return Scaffold(
      appBar: AppBar(title: Text('Mood Statistics')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(
          BarChartData(
            barGroups: moodFrequency.entries.map((entry) {
              return BarChartGroupData(
                x: moodFrequency.keys.toList().indexOf(entry.key),
                barRods: [
                  BarChartRodData(
                    toY: entry.value.toDouble(),
                    color: Colors.blue,
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Map<String, int> _calculateMoodFrequency() {
    Map<String, int> moodFrequency = {};

    for (var mood in moodBox.values) {
      if (moodFrequency.containsKey(mood)) {
        moodFrequency[mood] = moodFrequency[mood]! + 1;
      } else {
        moodFrequency[mood] = 1;
      }
    }

    return moodFrequency;
  }
}
