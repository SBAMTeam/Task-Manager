import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/ButtonBuiler.dart';
import 'package:taskmanager/View/Components/Constants.dart';
import 'package:taskmanager/View/Components/TextBuilder.dart';
import 'package:flutter/services.dart';

import 'Login.dart';

class RegistrationComplete extends StatelessWidget {
  final serverCodeFromDB;
  const RegistrationComplete({Key key, this.serverCodeFromDB})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      // 5s over, navigate to a new page
      Get.off(Login());
    });
    // var serverCode = serverCodeFromDB; //uncomment when we get data from db
    var serverCode = placeholder;
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(
                horizontal: Get.width / 8, vertical: Get.height / 15),
            child: Center(
              child: RichText(
                text: TextSpan(
                  text: 'Registration Complete! ',
                  style: TextStyle(
                      color: Color(textColor),
                      fontSize: 37,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
