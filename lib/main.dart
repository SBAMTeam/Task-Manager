import 'dart:ffi';
import 'dart:io';
import 'package:sqlite3/open.dart';
import 'package:taskmanager/Controllers/navigation_controller.dart';
import 'Controllers/firebase_controller.dart';
import 'Database/database.dart' as myDB;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Controllers/server_controller.dart';
import 'Controllers/task_controller.dart';
import 'Controllers/user_controller.dart';
import 'View/Pages/splash_screen.dart';

main() async {
  Get.lazyPut(() => TaskController(), fenix: true);
  Get.lazyPut(() => UserController(), fenix: true);
  Get.lazyPut(() => ServerController(), fenix: true);
  Get.lazyPut(() => NavigationController(), fenix: true);
  WidgetsFlutterBinding.ensureInitialized();

  Get.lazyPut(() => FirebaseController(), fenix: true);
  Get.find<FirebaseController>();

  runApp(TaskManager());
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
  TaskManager({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    open.overrideFor(OperatingSystem.linux, _openOnLinux);
    open.overrideFor(OperatingSystem.windows, _openOnWindows);
    final db = myDB.Database();

    return MultiProvider(
      providers: [
        Provider(create: (_) => db.userDao),
        Provider(create: (_) => db.serverDao),
        Provider(create: (_) => db.taskDao),
      ],
      child: GetMaterialApp(
        // debugShowCheckedModeBanner: false,
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
