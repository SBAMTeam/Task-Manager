import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/user_controller.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/View/Components/navigation_bar.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'login.dart';
import 'server_list_ui.dart';

class SplashScreen extends GetView<UserController> {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.getUserLastServer();

    Future.delayed(Duration(seconds: 3), () async {
      if (await DBFunctions.isUserLoggedIn() == true) {
        _userLoggedIn(controller);
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

_userLoggedIn(controller) {
  controller.getUsername();
  controller.getNickname(); //get needed userinfo for next screen
  taskController.fetchUserServerTasks(controller.userLastServer.value);
  if (controller.userLastServer.value != null) {
    serverController.currentServer.value = controller.userLastServer.value;
    Get.off(() => NavBar());
    return;
  } else {
    Get.off(() => ServersListUI(
          firstEntry: true,
        ));
    return;
  }
}
