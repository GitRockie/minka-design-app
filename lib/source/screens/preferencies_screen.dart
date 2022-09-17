import 'package:flutter/material.dart';

class PreferenciesScreen extends StatelessWidget {
  const PreferenciesScreen({Key? key}) : super(key: key);

  static const String routerName = 'Preferencies';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('PreferenciesScreen'),
      ),
    );
  }
}
