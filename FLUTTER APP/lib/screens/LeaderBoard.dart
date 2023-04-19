import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> entries = [
    {
      'name': 'John',
      'points': 100,
    },
    {
      'name': 'Alice',
      'points': 80,
    },
    {
      'name': 'Bob',
      'points': 60,
    },
    {
      'name': 'Carol',
      'points': 40,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            Map<String, dynamic> entry = entries[index];
            String name = entry['name'];
            int points = entry['points'];
            return ListTile(
              leading: Text((index + 1).toString()), // Rank
              title: Text(name),
              trailing: Text('${points} points'),
            );
          },
        ),
      ),
    );
  }
}
