import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.teal,
        child: const Icon(Icons.qr_code_scanner_outlined),
        onPressed: () async {
          try {
            String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                "#F04F33", "Cancel", false, ScanMode.QR);

            print(barcodeScanRes);
          } on PlatformException catch (e) {
//never calling
            throw Exception(e.message);
          }
        });
  }
}
