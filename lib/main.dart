import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Database/database.dart';
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
        Provider(create: (_) => db.taskDao),
      ],
      child: GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'Nunito',
        ),
        home: SplashScreen(),
      ),
    );
  }
}
