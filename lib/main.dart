import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minka_design_app/source/providers/scan_list_provider.dart';
import 'package:minka_design_app/source/providers/ui_provider.dart';

import 'package:minka_design_app/source/screens/basic_design.dart';
import 'package:minka_design_app/source/screens/home_screen.dart';
import 'package:minka_design_app/source/screens/map_screen.dart';
import 'package:minka_design_app/source/screens/scroll_design.dart';
import 'package:minka_design_app/source/screens/settings_screen.dart';
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
        initialRoute: HomeScreen.routerName,
        routes: {
          HomeScreen.routerName: (_) => const HomeScreen(),
          QrReaderScreen.routerName: (_) => const QrReaderScreen(),
          MapScreen.routerName: (_) => const MapScreen(),
          SettingsScreen.routerName: (_) => const SettingsScreen(),
          BasicDesignScreen.routerName: (_) => const BasicDesignScreen(),
          ScrollDesignScreen.routerName: (_) => const ScrollDesignScreen(),
        },
        theme: ThemeData(
            primaryColor: Colors.deepPurple,
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurple)),
      ),
    );
  }
}
