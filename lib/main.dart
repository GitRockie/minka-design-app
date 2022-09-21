import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minka_design_app/source/providers/scan_list_provider.dart';
import 'package:minka_design_app/source/providers/ui_provider.dart';

import 'package:minka_design_app/source/screens/screens.dart';
import 'package:minka_design_app/source/share_preferences/preferences.dart';

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(const MyApp());
}

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
          PreferencesScreen.routerName: (_) => const PreferencesScreen(),
          QrReaderScreen.routerName: (_) => const QrReaderScreen(),
          MapScreen.routerName: (_) => const MapScreen(),
          SettingsScreen.routerName: (_) => const SettingsScreen(),
          BasicDesignScreen.routerName: (_) => const BasicDesignScreen(),
          ScrollDesignScreen.routerName: (_) => const ScrollDesignScreen(),
        },
        theme: ThemeData.light(),
      ),
    );
  }
}
