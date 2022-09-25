import 'package:flutter/material.dart';
import 'package:minka_design_app/source/providers/scan_list_provider.dart';

import 'package:minka_design_app/source/providers/ui_provider.dart';
import 'package:provider/provider.dart';

import 'package:minka_design_app/source/screens/directions_screen.dart';

import '../widgets/custom_bottom_navigation.dart';
import '../widgets/scan_button.dart';
import '../widgets/side_menu.dart';
import 'maps_history_screen.dart';

class QrReaderScreen extends StatelessWidget {
  const QrReaderScreen({Key? key}) : super(key: key);
  static const String routerName = 'QR_reader';

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
      drawer: const SideMenu(),
      body: Stack(children: const [_QrReaderScreenBody()]),
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

    //Using of ScanListProvider
    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);
    switch (currentIndex) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return MapsHistoryScreen();

      case 1:
        scanListProvider.loadScansByType('http');
        return const DirectionsScreen();

      default:
        return MapsHistoryScreen();
    }
  }
}
