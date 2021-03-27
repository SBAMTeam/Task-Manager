import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Database/database.dart';

import 'package:taskmanager/View/Components/Constants.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/CreateServer.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/JoinServer.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/LoggedInPage.dart';
import 'package:taskmanager/View/Pages/Login.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/MainPage.dart';
import 'package:taskmanager/View/Pages/ServerCodeCreated.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/_servers.dart';
// ignore: unused_import
import 'View/Pages/HomePage.dart';
import 'View/Pages/Register.dart';
import 'package:provider/provider.dart';

main() async {
  runApp(TaskManager());
}

class TaskManager extends StatelessWidget {
  const TaskManager({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final db = Database();

    return MultiProvider(
      providers: [
        Provider(create: (_) => db.userDao),
        Provider(create: (_) => db.serverDao),
      ],
      child: GetMaterialApp(
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
}
