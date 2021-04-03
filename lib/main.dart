import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/server_controller.dart';
import 'package:taskmanager/Controllers/task_controller.dart';
import 'package:taskmanager/Controllers/user_controller.dart';
import 'package:taskmanager/Database/database.dart' as myDB;
// ignore: unused_import
import 'package:taskmanager/View/Components/constants.dart';
// ignore: unused_import
import 'package:taskmanager/View/Components/transparent_app_bar.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/create_server.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/join_server.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/logged_in_page.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/Login.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/main_page.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/server_code_created.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/create_task.dart';
// import 'package:taskmanager/View/Pages/_servers.dart';
// ignore: unused_import
// ignore: unused_import
import 'View/Pages/server_page.dart';
// ignore: unused_import
import 'View/Pages/register.dart';
import 'package:provider/provider.dart';
// ignore: unused_import
import 'View/Pages/server_list.dart';
import 'View/Pages/splash_screen.dart';
import 'dart:ffi';
import 'dart:io';
import 'package:sqlite3/open.dart';

main() {
  open.overrideFor(OperatingSystem.linux, _openOnLinux);
  open.overrideFor(OperatingSystem.windows, _openOnWindows);
  Get.lazyPut(() => TaskController(), fenix: true);
  Get.lazyPut(() => UserController(), fenix: true);
  Get.lazyPut(() => ServerController(), fenix: true);

  runApp(TaskManager());
  Get.lazyPut(() => TaskController(), fenix: true);
  Get.lazyPut(() => UserController(), fenix: true);
  Get.lazyPut(() => ServerController(), fenix: true);
}

DynamicLibrary _openOnLinux() {
  final script = File(Platform.script.toFilePath());
  final libraryNextToScript = File('${script.path}/sqlite3.so');
  return DynamicLibrary.open(libraryNextToScript.path);
}

DynamicLibrary _openOnWindows() {
  final script = File(Platform.script.toFilePath());
  final libraryNextToScript = File('${script.path}/sqlite3.dll');
  return DynamicLibrary.open(libraryNextToScript.path);
}

class TaskManager extends StatelessWidget {
  const TaskManager({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final db = myDB.Database();

    return MultiProvider(
      providers: [
        Provider(create: (_) => db.userDao),
        Provider(create: (_) => db.serverDao),
        Provider(create: (_) => db.taskDao),
      ],
      child: GetMaterialApp(
        title: 'SBAM Tasks',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Nunito',
        ),
        home: SplashScreen(),
      ),
    );
  }
}
