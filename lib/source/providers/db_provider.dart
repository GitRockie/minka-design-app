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

    return res;
  }

  Future<int?> newScan(ScanModel newScan) async {
    final db = await database;
    final res = await db?.insert('Scans', newScan.toJson());
    print(res);
    return res;
  }
}
