import 'package:flutter/material.dart';
import 'package:minka_design_app/source/widgets/scan_tiles.dart';

class MapsHistoryScreen extends StatelessWidget {
  const MapsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScanTiles(type: 'geo');
  }
}
