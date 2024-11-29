import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';
import '../widgets/entry_card.dart';
import '../mock/mock_entries.dart';
import 'entry_screen.dart';
import 'settings_screen.dart';
import '../models/diary_entry.dart';

class HomeScreen extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  HomeScreen({required this.toggleTheme, required this.isDarkMode});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<DiaryEntry> entries = mockEntries;

  void _navigateToEntryScreen([DiaryEntry? entry]) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EntryScreen(existingEntry: entry),
      ),
    );

    if (result != null && result is DiaryEntry) {
      setState(() {
        if (entry != null) {
          // Update existing entry
          final index = entries.indexOf(entry);
          entries[index] = result;
        } else {
          // Add new entry
          entries.add(result);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate('title')),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsScreen(
                    toggleTheme: widget.toggleTheme,
                    isDarkMode: widget.isDarkMode,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _navigateToEntryScreen(entries[index]),
            child: EntryCard(entry: entries[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToEntryScreen(),
        child: Icon(Icons.add),
      ),
    );
  }
}
