import 'dart:async';
import 'dart:core';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todey/data/models/todo_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static final int _version = 1;
  final String tableName = "todeytabletest";

  //
  final String columnId = "id";
  final String columnTitle = "eventTitle";
  final String columnNote = "eventNote";
  final String columnDate = "eventDate";
  final String columnType = "eventType";
  final String columnAttached = 'eventAttachment';
  final String columnStartedDate = "eventStartedDate";
  final String columnEndedDate = "eventEndedDate";
  final String columnCategory = "eventCategory";
  final String columnCreatedTime = "eventCreatedDate";

  static Database _db;

  DatabaseHelper._internal();
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initializeDB();
    return _db;
  }

  DatabaseHelper.internal();

  initializeDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "todeytest3.db");
    var myDB = await openDatabase(path, version: _version, onCreate: _onCreate);
    return myDB;
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName($columnId INTEGER PRIMARY KEY AUTOINCREMENT, $columnTitle TEXT, $columnNote TEXT, $columnDate TEXT, $columnType INTEGER, $columnCreatedTime TEXT, $columnStartedDate TEXT, $columnEndedDate TEXT, $columnCategory, $columnAttached TEXT)");
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
  Future<List<EventModel>> getAllEvent() async {
    var dbClient = await db;
    final List<Map<String, dynamic>> maps = await dbClient.query(tableName);
    return List.generate(
      maps.length,
      (index) {
        return EventModel(
            id: maps[index]["id"],
            eventTitle: maps[index]["eventTitle"],
            eventNote: maps[index]["eventNote"],
            eventCreatedDate: maps[index]["eventCreatedDate"],
            eventType: maps[index]["eventType"],
            eventStartedDate: maps[index]["eventStartedDate"],
            eventEndedDate: maps[index]["eventEndedDate"],
            eventCategory: maps[index]["eventCategory"],
            eventDate: maps[index]["eventDate"],
            eventAttachment: maps[index]['eventAttachment']);
      },
    );
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

  // CLEAR DATA
  Future<void> clearDB() async {
    var dbClient = await db;
    return dbClient.close();
  }
}
