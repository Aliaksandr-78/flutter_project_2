import 'package:flutter/material.dart';
import '../models/diary_entry.dart';

class EntryCard extends StatelessWidget {
  final DiaryEntry entry;

  EntryCard({required this.entry});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${entry.date.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(entry.content),
          ],
        ),
      ),
    );
  }
}
