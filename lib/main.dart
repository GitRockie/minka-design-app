import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:minka_design_app/source/screens/basic_design.dart';
import 'package:minka_design_app/source/screens/home_screen.dart';
import 'package:minka_design_app/source/screens/scroll_design.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home_screen',
      theme: ThemeData.dark(),
      routes: {
        'home_screen': (_) => const HomeScreen(),
        'basic_design': (_) => const BasicDesignScreen(),
        'scroll_screen': (_) => const ScrollDesignScreen(),
      },
    );
  }
}
