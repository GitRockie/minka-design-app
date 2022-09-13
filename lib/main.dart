import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minka_design_app/source/providers/scan_list_provider.dart';
import 'package:minka_design_app/source/providers/ui_provider.dart';

import 'package:minka_design_app/source/screens/basic_design.dart';
import 'package:minka_design_app/source/screens/home_screen.dart';
import 'package:minka_design_app/source/screens/map_screen.dart';
import 'package:minka_design_app/source/screens/scroll_design.dart';
import 'package:provider/provider.dart';

import 'source/screens/qr_reader_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: 'qr_reader_screen',
        routes: {
          'qr_reader_screen': (_) => const QrReaderScreen(),
          'map_screen': (_) => const MapScreen(),
          'home_screen': (_) => const HomeScreen(),
          'basic_design': (_) => const BasicDesignScreen(),
          'scroll_screen': (_) => const ScrollDesignScreen(),
        },
        theme: ThemeData(
            primaryColor: Colors.deepPurple,
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurple)),
      ),
    );
  }
}
