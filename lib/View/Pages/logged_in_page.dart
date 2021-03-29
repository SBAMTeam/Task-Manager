import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/button_builder.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Pages/create_server.dart';
import 'package:taskmanager/View/Pages/join_server.dart';
import 'server_list.dart';

class LoggedInPage extends StatefulWidget {
  LoggedInPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<LoggedInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width / 12),
          // , vertical: Get.height / 13),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: sizedBoxBigSpace,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Welcome to ',
                    style: TextStyle(
                        color: Color(textColor),
                        fontSize: 37,
                        fontWeight: FontWeight.bold),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonBuilder(
                      height: 55.0,
                      edge: 9.0,
                      color: Color(buttonColorOne),
                      text: 'Create Server',
                      onPress: () => Get.to(() => CreateServer()),
                    ),
                  ],
                ),
                SizedBox(height: Get.height / 1000),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonBuilder(
                      height: 55.0,
                      edge: 9.0,
                      text: 'Join Server',
                      textColor: Color(textColor),
                      color: Color(buttonColorTwo),
                      onPress: () => Get.to(() => JoinServer()),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonBuilder(
                      height: 55.0,
                      edge: 9.0,
                      text: 'Home',
                      textColor: Color(textColor),
                      color: Color(buttonColorTwo),
                      onPress: () {
                        Get.to(() => ServersList());
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
