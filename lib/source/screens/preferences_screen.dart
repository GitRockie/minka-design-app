import 'package:flutter/material.dart';

import '../share_preferences/preferences.dart';
import '../widgets/side_menu.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({Key? key}) : super(key: key);

  static const String routerName = 'Preferences';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Preferences'),
        ),
        drawer: const SideMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('isDarkMode: ${Preferences.isDarkmode}'),
            const Divider(),
            Text('Role: ${Preferences.role}'),
            const Divider(),
            Text('Username: ${Preferences.name}'),
            const Divider(),
          ],
        ));
  }
}
