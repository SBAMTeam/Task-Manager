import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:taskmanager/Models/Usermodel.dart';

class DatabaseHelper {
  static final _dbName = 'myDatabase.db';
  static final _dbVersion = 1;
  static final _tableName = 'user_details';
  static final columnnLogMesseges = 'logMesseges';
  static final columnId = "userId";
  static final columnUsername = "username";
  static final columnUserEmail = 'userEmail';
  static final columnJwt = 'jwt';
  static final columnUserNickname = 'userNickname';
  static final columnUserServersToJson = 'userServers';
  static final columnUserpermissionsToJson = 'userPermissions';
  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initiateDatabase();
    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path, version: _dbVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $_tableName (
      $columnnLogMesseges TEXT,
      $columnId INTEGER NOT NULL,
      $columnUsername TEXT NOT NULL,
      $columnUserEmail TEXT,
      $columnJwt TEXT NOT NULL, 
      $columnUserNickname TEXT,
      $columnUserServersToJson TEXT,
      $columnUserpermissionsToJson TEXT
      )

      ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAll() async {
    Database db = await instance.database;
    return await db.query(_tableName);
  }

  Future update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    var username = row[columnUsername];
    return await db.update(_tableName, row,
        where: '$columnId = ? $columnUsername = ?', whereArgs: [id, username]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;

    return await db.delete(_tableName, where: '$columnId = ?', whereArgs: [id]);
  }

  Future fetchUserData(int id) async {
    Database db = await instance.database;

    return await db.query(_tableName, where: '$columnId = ?', whereArgs: [id]);
  }
}
