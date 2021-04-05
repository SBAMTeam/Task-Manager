import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/constants.dart';

import 'Login.dart';

class RegistrationComplete extends StatelessWidget {
  const RegistrationComplete({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Get.offAll(() => Login());
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
                    text: 'Registration Complete! ',
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
