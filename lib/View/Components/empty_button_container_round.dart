import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/constants.dart';

class EmptyContainerButton extends StatelessWidget {
  const EmptyContainerButton({Key key, this.height, this.width, this.color})
      : super(key: key);
  final height, width, color;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width ?? Get.width / 2.5,
      height: height ?? 55,
      decoration: BoxDecoration(
        color: Color(color ?? buttonColorOne),
        borderRadius: BorderRadius.circular(9),
      ),
    );
  }
}
