import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:uas_mobile/models/anggota.dart';

class DbHelper {
  static DbHelper _dbHelper;
  static Database _database;
  DbHelper._createObject();
  factory DbHelper() {
    if (_dbHelper == null) {
      _dbHelper = DbHelper._createObject();
    }
    return _dbHelper;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'angota.db';
    var todoDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    return todoDatabase;
  }

  void _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE anggota (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nama TEXT,
        alamat TEXT,
        nomor TEXT
      )
    ''');
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  Future<List<Map<String, dynamic>>> select() async {
    Database db = await this.database;
    var mapList = await db.query('anggota', orderBy: 'nama');
    return mapList;
  }

  Future<int> insert(Anggota object) async {
    Database db = await this.database;
    int count = await db.insert('anggota', object.toMap());
    return count;
  }

  Future<int> update(Anggota object) async {
    Database db = await this.database;
    int count = await db.update('anggota', object.toMap(),
        where: 'id=?',
        whereArgs: [object.id]);
    return count;
  }

  Future<int> delete(int id) async {
    Database db = await this.database;
    int count = await db.delete('anggota',
        where: 'id=?',
        whereArgs: [id]);
    return count;
  }

  Future<List<Anggota>> getAnggotaList() async {
    var anggotaMapList = await select();
    int count = anggotaMapList.length;
    List<Anggota> anggotaList = List<Anggota>();
    for (int i=0; i<count; i++) {
      anggotaList.add(Anggota.fromMap(anggotaMapList[i]));
    }
    return anggotaList;
  }
}