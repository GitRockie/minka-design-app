import 'package:flutter/material.dart';

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
          children: const [
            Text('isDarkMode'),
            Divider(),
            Text('Role'),
            Divider(),
            Text('Username'),
            Divider(),
          ],
        ));
  }
}
