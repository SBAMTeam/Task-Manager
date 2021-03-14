import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:taskmanager/Models/Usermodel.dart';

class DatabaseHelper {
  static Database _database;
  static Future<Database> getDBConnector() async {
    if (_database != null) {
      return _database;
    }
    return await _initDatabase();
  }

  static Future<Database> _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), "TaskManager.db"),
      onCreate: (db, version) async {
        _database.execute("");
      },
      version: 1,
    );
    return _database;
  }

  static Future<void> insertUser(Usermodel usermodel) async {
    final Database db = await getDBConnector();

    await db.insert('Usermodel', usermodel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<void> selectUser() {
    _database.execute("SELECT * FROM user_data");
  }
}
