import 'package:flutter/material.dart';

import 'package:minka_design_app/source/providers/db_provider.dart';
import 'package:minka_design_app/source/providers/ui_provider.dart';
import 'package:provider/provider.dart';

import 'package:minka_design_app/source/screens/directions_screen.dart';
import 'package:minka_design_app/source/widgets/background.dart';
import '../widgets/custom_bottom_navigation.dart';
import '../widgets/scan_button.dart';
import 'maps_history_screen.dart';

class QrReaderScreen extends StatelessWidget {
  const QrReaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text('History'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_forever))
        ],
      ),
      body: Stack(children: const [Background(), _QrReaderScreenBody()]),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}

class _QrReaderScreenBody extends StatelessWidget {
  const _QrReaderScreenBody();

  @override
  Widget build(BuildContext context) {
    //Selected menu Opt
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    //TODO: Temporary DB reading
    //final tempScan = ScanModel(value: 'http://doitminka.com');
    //DBProvider.db.deleteAllScan().then(print);

    switch (currentIndex) {
      case 0:
        return const MapsHistoryScreen();

      case 1:
        return const DirectionsScreen();

      default:
        return const MapsHistoryScreen();
    }
  }
}
