import 'package:flutter/material.dart';
import 'package:minka_design_app/source/widgets/background.dart';

import '../widgets/custom_bottom_navigation.dart';
import '../widgets/scan_button.dart';

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
      body: Stack(children: const [
        Background(),
        Center(
          child: Text('QrReaderScreen'),
        ),
      ]),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavigation(),
    );
  }
}
