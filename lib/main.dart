import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:taskmanager/View/Components/Constants.dart';

// ignore: unused_import
import 'package:taskmanager/View/Pages/CreateServer.dart';
import 'package:taskmanager/View/Pages/HomePage.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/JoinServer.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/LoggedInPage.dart';
import 'package:taskmanager/View/Pages/Login.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/MainPage.dart';
import 'package:path/path.dart';

main() async {
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Nunito',
      ),
      home: Scaffold(
        backgroundColor: Color(backgroundColor),
        body: HomePage(),
      ),
    ),
  );
}
