import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'localization/app_localizations.dart';
import 'themes/light_theme.dart';
import 'themes/dark_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyDiaryApp());
}

class MyDiaryApp extends StatefulWidget {
  @override
  _MyDiaryAppState createState() => _MyDiaryAppState();
}

class _MyDiaryAppState extends State<MyDiaryApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Diary',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? darkTheme : lightTheme,
      supportedLocales: [
        Locale('en', ''),
        Locale('ru', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: Locale('en'),
      home: HomeScreen(toggleTheme: toggleTheme, isDarkMode: isDarkMode),
    );
  }
}
