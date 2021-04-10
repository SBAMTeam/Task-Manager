import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taskmanager/Controllers/server_controller.dart';
import 'package:taskmanager/Controllers/user_controller.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/View/Components/NavigationBar.dart';
import 'package:taskmanager/View/Components/button_builder.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Components/empty_button_container_round.dart';
import 'package:taskmanager/View/Components/text_builder.dart';
import 'package:taskmanager/View/Pages/create_server.dart';
import 'package:taskmanager/View/Pages/join_server.dart';
import 'package:taskmanager/View/Pages/server_list_builder_ui.dart';
import 'server_list.dart';

class LoggedInPage extends GetView<ServerController> {
  LoggedInPage({Key key}) : super(key: key);
  final userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    var tmp = 0;
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: Obx(() {
        if (tmp == 1) {
          userController.userLoggedIn();
        }
        if (userController.loggedIn.value == false) {
          // if (true) {
          Future.delayed(Duration(seconds: 1), () async {
            userController
                .loggedIn(await DBFunctions.isUserLoggedIn());
          });
          return SafeArea(
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: Get.width / 12),
              // , vertical: Get.height / 13),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: sizedBoxBigSpace,
                    ),
                    Row(
                      children: [
                        AutoSizeText.rich(
                          TextSpan(
                            text: 'Welcome to ',
                            style: TextStyle(
                                color: Color(textColor),
                                fontSize: 42,
                                fontWeight: FontWeight.w900),
                            children: <TextSpan>[
                              TextSpan(
                                text: '\nSBAM ',
                                style: TextStyle(
                                    color: Color(textColorSecondary),
                                    fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'Tasks.',
                                style: TextStyle(
                                  color: Color(textColor),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height / 5 + 9,
                    ),
                    Shimmer.fromColors(
                      child: Column(
                        children: [
                          EmptyContainerButton(),
                          SizedBox(height: 15),
                        ],
                      ),
                      baseColor: Color(buttonColorOne),
                      highlightColor: Color(buttonColorTwo),
                    ),
                    Shimmer.fromColors(
                        child: Column(
                          children: [
                            EmptyContainerButton(),
                            SizedBox(height: 15),
                            EmptyContainerButton(),
                          ],
                        ),
                        baseColor: Color(buttonColorTwo),
                        highlightColor: Color(buttonColorOne))
                  ],
                ),
              ),
            ),
          );
        } else if (userController.loggedIn.value) {
          return SafeArea(
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: Get.width / 12),
              // , vertical: Get.height / 13),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: sizedBoxBigSpace,
                    ),
                    AutoSizeText.rich(
                      TextSpan(
                        text: 'Welcome to ',
                        style: TextStyle(
                            color: Color(textColor),
                            fontSize: 42,
                            fontWeight: FontWeight.w900),
                        children: <TextSpan>[
                          TextSpan(
                            text: '\nSBAM ',
                            style: TextStyle(
                                color: Color(textColorSecondary),
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'Tasks.',
                            style: TextStyle(
                              color: Color(textColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 5,
                    ),
                    Center(
                      child: ButtonBuilder(
                        height: 55.0,
                        edge: 9.0,
                        color: Color(buttonColorOne),
                        text: 'Create Server',
                        onPress: () => Get.to(() => CreateServer()),
                      ),
                    ),
                    Center(
                      child: ButtonBuilder(
                        height: 55.0,
                        edge: 9.0,
                        text: 'Join Server',
                        textColor: Color(textColor),
                        color: Color(buttonColorTwo),
                        onPress: () => Get.to(() => JoinServer()),
                      ),
                    ),
                    Center(
                      child: ButtonBuilder(
                        height: 55.0,
                        edge: 9.0,
                        text: 'Home',
                        textColor: Color(textColor),
                        color: Color(buttonColorTwo),
                        onPress: () {
                          Get.to(() => NavBar());
                          // controller.fetchServers();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Text(
              "something's not rigght.. check logged_in_page");
        }
      }),
    );
  }
}
