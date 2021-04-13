import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/user_controller.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/View/Components/NavigationBar.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Pages/server_list.dart';
import 'package:taskmanager/View/Pages/server_page.dart';

import 'login.dart';
import 'server_list.dart';

class SplashScreen extends GetView<UserController> {
  const SplashScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.getUsername();
    controller.getNickname();
    controller.getUserLastServer();
    taskController.fetchUserServerTasks(controller.userLastServer.value);
    Future.delayed(Duration(seconds: 3), () async {
      if (await DBFunctions.isUserLoggedIn() == true) {
        if (controller.userLastServer.value != null) {
          Get.off(() => NavBar());
          return;
        } else {
          Get.off(() => ServersList());
        }
      } else {
        Get.off(() => Login());
        return;
      }
    });
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 12),
                // , vertical: Get.height / 13),
                child: RichText(
                  text: TextSpan(
                    text: 'Enjoy placeholder splashscreen!',
                    style: TextStyle(
                        color: Color(textColor),
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
