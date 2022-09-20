import 'package:flutter/material.dart';
import 'package:minka_design_app/source/widgets/side_menu.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const String routerName = 'Settings';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDarkMode = false;
  int role = 1;
  String name = 'Mauricio';

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
                    value: isDarkMode,
                    title: const Text('Darkmode'),
                    onChanged: (value) {
                      isDarkMode = value;
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    value: 1,
                    groupValue: role,
                    title: const Text(('Freelancer')),
                    onChanged: (value) {
                      role = value ?? 1;
                      setState(() {});
                    }),
                const Divider(),
                RadioListTile<int>(
                    value: 2,
                    groupValue: role,
                    title: const Text(('Company')),
                    onChanged: (value) {
                      role = value ?? 2;
                      setState(() {});
                    }),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
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
