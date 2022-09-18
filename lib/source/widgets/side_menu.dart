import 'package:flutter/material.dart';
import 'package:minka_design_app/source/screens/screens.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),
          ListTile(
              leading: const Icon(Icons.pages_outlined),
              title: const Text('Home'),
              onTap: () {
                Navigator.pushReplacementNamed(context, HomeScreen.routerName);
              }),
          ListTile(
              leading: const Icon(Icons.manage_accounts_outlined),
              title: const Text('Preferences'),
              onTap: () {
                Navigator.pushReplacementNamed(
                    context, PreferencesScreen.routerName);
              }),
          ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () {
                //Navigator.pop(context);
                Navigator.pushReplacementNamed(
                    context, SettingsScreen.routerName);
              }),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover)),
      child: Container(),
    );
  }
}
