import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/ButtonBuiler.dart';
import 'package:taskmanager/View/Components/Constants.dart';
import 'package:taskmanager/View/Components/TextBuilder.dart';
import 'package:flutter/services.dart';

class RegistrationComplete extends StatelessWidget {
  final serverCodeFromDB;
  const RegistrationComplete({Key key, this.serverCodeFromDB})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var serverCode = serverCodeFromDB; //uncomment when we get data from db
    var serverCode = placeholder;
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
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
