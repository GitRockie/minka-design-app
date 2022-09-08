import 'package:flutter/material.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.teal,
        child: const Icon(Icons.qr_code_scanner_outlined),
        onPressed: () {});
  }
}
