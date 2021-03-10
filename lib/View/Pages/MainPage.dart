import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/ButtonBuiler.dart';
import 'package:taskmanager/View/Components/Constants.dart';
import 'package:taskmanager/View/Components/TransparentAppBar.dart';
import 'package:taskmanager/View/Pages/Register.dart';

import 'Login.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TransparentAppBar(),
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width / 8),
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
                      text: 'Register',
                      onPress: () => Get.to(() => Register()),
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
                      text: 'Login',
                      textColor: Color(textColor),
                      color: Color(buttonColorTwo),
                      onPress: () => Get.to(() => Login()),
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
