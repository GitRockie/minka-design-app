import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const String routerName = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('LoginScreen'),
      ),
    );
  }
}
