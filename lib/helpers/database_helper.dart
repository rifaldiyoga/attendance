import 'dart:io';

import 'package:attendance/models/absensi.dart';
import 'package:attendance/models/lokasi.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AttendanceDatabaseHelper {
  static Database? _productDb;
  static AttendanceDatabaseHelper? _productDatabaseHelper;

  AttendanceDatabaseHelper._createInstance();

  static final AttendanceDatabaseHelper db =
      AttendanceDatabaseHelper._createInstance();

  factory AttendanceDatabaseHelper() {
    if (_productDatabaseHelper == null) {
      _productDatabaseHelper = AttendanceDatabaseHelper._createInstance();
    }
    return _productDatabaseHelper!;
  }

  Future<Database> get database async {
    if (_productDb == null) {
      _productDb = await initializeDatabase();
    }
    return _productDb!;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'attendance.db';
    var myDatabase = await openDatabase(path, version: 2, onCreate: _createDb);
    return myDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute("CREATE TABLE lokasi"
        "(id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "nama_lokasi TEXT, alamat TEXT, coordinate TEXT)");
    await db.execute("CREATE TABLE absensi"
        "(id INTEGER PRIMARY KEY AUTOINCREMENT,"
        "date TEXT, lokasi TEXT, type TEXT,lokasi_id INTEGER, coordinate TEXT)");
  }

  Future<List<Map<String, dynamic>>> getLokasiMapList() async {
    Database db = await this.database;
    var result = await db.query(Lokasi.tableName, orderBy: "id ASC");
    return result;
  }

  Future<List<Map<String, dynamic>>> getAbsensiMapList() async {
    Database db = await this.database;
    var result = await db.query(Absensi.tableName, orderBy: "id DESC");
    return result;
  }

  Future<int> insertLokasi(Lokasi product) async {
    // print(cart);
    Database db = await this.database;
    var result = await db.insert(Lokasi.tableName, product.toJson());
    print(result);
    return result;
  }

  Future<int> updateLokasi(Lokasi product) async {
    // print("updating task ${task.id} ${task.name} current status ${task.completed}");
    var db = await this.database;
    var result = await db.update(Lokasi.tableName, product.toJson(),
        where: 'id = ?', whereArgs: [product.id]);
    return result;
  }

  Future<int> deleteLokasi(int id) async {
    // print("Deleting Lokasi with id: $id ");
    var db = await this.database;
    int result =
        await db.delete(Lokasi.tableName, where: 'id = ?', whereArgs: [id]);
    // print("Delete result: $result");
    return result;
  }

  Future<int> getCount(tableName) async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $tableName');
    int result = Sqflite.firstIntValue(x) ?? 0;
    return result;
  }

  Future<List<Lokasi>> getLokasiList() async {
    var productMapList = await getLokasiMapList();
    int count = await getCount(Lokasi.tableName);

    List<Lokasi> productList = <Lokasi>[];
    for (int i = 0; i < count; i++) {
      productList.add(Lokasi.fromJson(productMapList[i]));
    }
    return productList;
  }

  Future<Lokasi?> getLokasiById(int id) async {
    Database db = await this.database;
    var data =
        await db.rawQuery("SELECT * FROM ${Lokasi.tableName} WHERE id = $id");

    return data.map((e) => Lokasi.fromJson(e)).firstOrNull;
  }

  Future<int> insertAbsensi(Absensi product) async {
    // print(cart);
    Database db = await this.database;
    var result = await db.insert(Absensi.tableName, product.toJson());
    return result;
  }

  Future<List<Absensi>> getAbsensiList() async {
    var productMapList = await getAbsensiMapList();
    int count = await getCount(Absensi.tableName);

    List<Absensi> productList = <Absensi>[];
    for (int i = 0; i < count; i++) {
      var absensi = Absensi.fromJson(productMapList[i]);
      absensi.lokasiModel = await getLokasiById(absensi.lokasiId!);
      productList.add(absensi);
    }
    return productList;
  }

  Future<Absensi?> getLastAbsensi() async {
    Database db = await this.database;
    var data = await db.rawQuery(
        "SELECT * FROM ${Absensi.tableName} ORDER BY id DESC LIMIT 1");

    return data.map((e) => Absensi.fromJson(e)).firstOrNull;
  }

  close() async {
    var db = await this.database;
    var result = db.close();
    return result;
  }
}
