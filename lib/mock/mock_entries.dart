import '../models/diary_entry.dart';

final mockEntries = [
  DiaryEntry(date: DateTime.now(), content: "Today was a great day!"),
  DiaryEntry(date: DateTime.now().subtract(Duration(days: 1)), content: "Started a new project."),
];
