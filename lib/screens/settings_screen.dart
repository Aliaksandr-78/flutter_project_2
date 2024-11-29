import 'package:flutter/material.dart';
import '../localization/app_localizations.dart';
import 'legal_screen.dart';

class SettingsScreen extends StatelessWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  SettingsScreen({required this.toggleTheme, required this.isDarkMode});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translate('settings')),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text(localizations.translate('dark_mode')),
            value: isDarkMode,
            onChanged: (value) {
              toggleTheme();
            },
          ),
          ListTile(
            title: Text(localizations.translate('privacy_policy')),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LegalScreen(
                    title: localizations.translate('privacy_policy'),
                    content:
                        'Your privacy is important to us. [Insert full policy here.]',
                  ),
                ),
              );
            },
          ),
          ListTile(
            title: Text(localizations.translate('terms_of_use')),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LegalScreen(
                    title: localizations.translate('terms_of_use'),
                    content:
                        'By using this app, you agree to the following terms. [Insert full terms here.]',
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
