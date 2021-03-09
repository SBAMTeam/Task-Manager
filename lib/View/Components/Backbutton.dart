import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/Constants.dart';

class Backbutton extends StatelessWidget {
  const Backbutton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios_rounded),
      color: Color(buttonColorOne),
      onPressed: () {
        Get.back();
      },
      tooltip: 'Back',
    );
  }
}
