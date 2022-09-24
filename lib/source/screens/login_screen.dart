import 'package:flutter/material.dart';
import 'package:minka_design_app/source/ui/input_decotations.dart';
import 'package:minka_design_app/source/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String routerName = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
      child: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 220,
          ),
          CardContainer(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text('Login', style: Theme.of(context).textTheme.headline4),
                const SizedBox(
                  height: 30,
                ),
                _LoginForm(),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            'Create new account',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 100,
          ),
        ],
      )),
    ));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        //TODO: mantain the KEY reference
        child: Column(
          children: [
            TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: 'minker.user@gmail.com',
                    labelText: 'Email',
                    prefixIcon: Icons.alternate_email_sharp)),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
                autocorrect: false,
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecorations.authInputDecoration(
                    hintText: '******',
                    labelText: 'Password',
                    prefixIcon: Icons.lock_clock_sharp)),
            const SizedBox(
              height: 50,
            ),
            MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 80, vertical: 15),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    )),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
