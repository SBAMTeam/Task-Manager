import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/button_builder.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Components/text_builder.dart';
import 'package:taskmanager/View/Components/transparent_app_bar.dart';

import 'login.dart';

class ServerCodeCreated extends StatelessWidget {
  final serverCodeFromDB;
  const ServerCodeCreated({Key key, this.serverCodeFromDB}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var serverCode = serverCodeFromDB; //uncomment when we get data from db
    var serverCode = placeholder;
    return Scaffold(
      appBar: TransparentAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 12),
            // , vertical: Get.height / 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/Lock.png',
                    scale: 2,
                  ),
                ),
                SizedBox(
                  height: sizedBoxBigSpace,
                ),
                TextBuilder(
                  text:
                      'This is your special code. You will need it to login to your account in the future',
                  fontSize: 30,
                ),
                SizedBox(
                  height: sizedBoxBigSpace * 2,
                ),
                TextBuilder(
                  text: serverCode,
                  decoration: TextDecoration.underline,
                ),
                SizedBox(
                  height: sizedBoxBigSpace * 2,
                ),
                ButtonBuilder(
                  text: 'Go to login page',
                  onPress: () {
                    Get.to(Login());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
