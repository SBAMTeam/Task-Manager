import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Backbutton extends StatelessWidget {
  const Backbutton({Key key, this.onPress}) : super(key: key);
  final onPress;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios_rounded),
      color: Colors.white,
      onPressed: onPress ??
          () {
            Get.back();
          },
      tooltip: 'Back',
    );
  }
}
