import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todey/models/todo_model.dart';

class SQFliteDB {
  static final SQFliteDB _instance = new SQFliteDB._internal();
  factory SQFliteDB() => _instance;
  static final int _version = 1;
  final String tableName = "todeytable";
  final String columnId = "id";
  final String columnTitle = "eventTitle";
  final String columnDescription = "eventDescription";
  final String columnDate = "eventDate";
  final String columnType = "eventType";
  final String columnAlarm = "preferAlarm";
  final String columnPriority = "eventPriority";
  final String columnCategory = "eventCategory";
  final String columnCreatedTime = "eventCreatedTime";

  static Database _db;

  SQFliteDB._internal();
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initializeDB();
    return _db;
  }

  SQFliteDB.internal();

  initializeDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "todeytest1.db");
    var myDB = await openDatabase(path, version: _version, onCreate: _onCreate);
    return myDB;
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnTitle TEXT, $columnDescription TEXT, $columnDate TEXT, $columnAlarm INTEGER, $columnCreatedTime TEXT, $columnCategory TEXT, $columnPriority TEXT, $columnType TEXT)");
    print("Table is created");
  }

  //CREATE DATA
  Future<int> saveEvent(EventModel eventModel) async {
    // ignore: await_only_futures
    var dbClient = await db;
    int res = await dbClient.insert("$tableName", eventModel.toJson());
    print(res.toString());
    return res;
  }

  //READ DATA

  Future<List> getAllEvent() async {
    var dbClient = await db;
    var result = await dbClient
        .rawQuery("SELECT * FROM $tableName ORDER BY $columnTitle ASC");

    return result.toList();
  }

  //UPDATE DATA

  Future<int> updateEvent(EventModel eventModel) async {
    var dbClient = await db;
    return await dbClient.update("$tableName", eventModel.toJson(),
        where: "$columnId = ? ", whereArgs: [eventModel.id]);
  }
  //DELETE DATA

  Future<int> deleteEvent(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(tableName, where: "$columnId = ? ", whereArgs: [id]);
  }
}
