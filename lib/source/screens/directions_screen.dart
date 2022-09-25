import 'package:flutter/material.dart';

import '../widgets/scan_tiles.dart';

class DirectionsScreen extends StatelessWidget {
  const DirectionsScreen({Key? key}) : super(key: key);

  static const String routerName = 'Directions';

  @override
  Widget build(BuildContext context) {
    return const ScanTiles(type: 'http');
  }
}
