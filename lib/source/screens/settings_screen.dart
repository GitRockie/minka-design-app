import 'package:flutter/material.dart';
import 'package:minka_design_app/source/widgets/side_menu.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const String routerName = 'Settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Settings'),
        ),
        drawer: const SideMenu(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Settings',
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.w300),
                ),
                const Divider(),
                SwitchListTile.adaptive(
                    value: true,
                    title: const Text('Darkmode'),
                    onChanged: (value) {}),
                const Divider(),
                RadioListTile<int>(
                    value: 1,
                    groupValue: 1,
                    title: const Text(('Freelancer')),
                    onChanged: (value) {}),
                const Divider(),
                RadioListTile<int>(
                    value: 2,
                    groupValue: 1,
                    title: const Text(('Company')),
                    onChanged: (value) {}),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    initialValue: 'Roman',
                    decoration: const InputDecoration(
                        labelText: 'Name', helperText: 'What is your name?'),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
