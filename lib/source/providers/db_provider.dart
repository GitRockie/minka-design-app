import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:minka_design_app/source/models/scan_model.dart';
export 'package:minka_design_app/source/models/scan_model.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database?> initDB() async {
    //Path where we store the database
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //Create path
    final path = join(documentsDirectory.path, 'ScansDB.db');
    print(path);
    //DB creation
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      //Multiline String autoincrement id INTEGER PRIMARY KEY,
      await db.execute('''
            CREATE TABLE Scans(
              id INTEGER PRIMARY KEY,
              type TEXT,
              value TEXT
            )
          
          ''');
    });
  }

  Future<int?> newScanRaw(ScanModel newScan) async {
    final id = newScan.id;
    final type = newScan.type;
    final value = newScan.value;
    //Verifuying DB
    final db = await database;

    final res = await db?.rawInsert(''' 

      INSERT INTO Scans ( id, type, value )
      VALUES ( $id, '$type','$value' )
    
    ''');
    //Last register inserted ID
    return res;
  }

  Future<int?> newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db?.insert('Scans', newScan.toJson());

    return res;
  }

  Future<ScanModel?> getScanById(int id) async {
    final db = await database;
    final res = await db?.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res!.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>?> getAllScans() async {
    final db = await database;
    final res = await db?.query('Scans');

    return res!.isNotEmpty
        ? res.map((s) => ScanModel.fromJson(s)).toList()
        : null;
  }

  Future<List<ScanModel>?> getScansByType(String type) async {
    final db = await database;
    final res = await db?.rawQuery('''
      SELECT * FROM Scans WHERE type ='$type'
    ''');

    return res!.isNotEmpty
        ? res.map((s) => ScanModel.fromJson(s)).toList()
        : [];
  }

  Future<int?> updateScan(ScanModel newScan) async {
    final db = await database;
    final res = await db?.update('Scans', newScan.toJson(),
        where: 'id = ?', whereArgs: [newScan.id]);

    return res;
  }

  Future<int?> deleteScan(id) async {
    final db = await database;
    final res = await db?.delete('Scans', where: 'id =?', whereArgs: [id]);

    return res;
  }

  Future<int?> deleteAllScan() async {
    final db = await database;
    final res = await db?.rawDelete('''
      DELETE FROM Scans
    ''');

    return res;
  }
}
