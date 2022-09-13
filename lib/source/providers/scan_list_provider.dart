import 'package:flutter/material.dart';
import 'package:minka_design_app/source/providers/db_provider.dart';

//Scans info provided centralized to update UI
class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String typeSelected = 'http';

  newScan(String value) async {
    //Inserting in DB
    final newScan = ScanModel(value: value);
    final id = await DBProvider.db.newScan(newScan);
    //Assign ID from DB to Model
    newScan.id = id;

    if (typeSelected == newScan.type) {
      scans.add(newScan);
      //UI conditionaly Update
      notifyListeners();
    }
  }

  loadScan() async {
    final scans = await DBProvider.db.getAllScans();
    this.scans = [...?scans];
    notifyListeners();
  }

  loadScansByType(String type) async {
    final scans = await DBProvider.db.getScansByType(type);
    this.scans = [...?scans];
    typeSelected = type;
    notifyListeners();
  }

  deleteAllScans() async {
    await DBProvider.db.getAllScans();
    scans = [...scans];
    notifyListeners();
  }

  deleteScansById(int id) async {
    await DBProvider.db.deleteScan(id);
    loadScansByType(typeSelected);
  }
}
