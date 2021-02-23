import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/Constants.dart';
import 'package:taskmanager/View/Pages/ServerCodeCreated.dart';

class ButtonBuilder extends StatelessWidget {
  final VoidCallback onPress;
  final text, textColor, fontWeight, width, height;
  const ButtonBuilder({
    Key key,
    this.text,
    this.textColor,
    this.fontWeight,
    this.width,
    this.height,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPress ?? () {},
      // onPressed: () {
      //   Future.delayed(Duration.zero, () {
      //     Get.to(ServerCodeCreated());
      //   });
      // },
      child: Container(
        child: Center(
            child: Text(
          text ?? 'PLACEHOLDER',
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600),
        )),
        width: width ?? Get.width / 2,
        height: height ?? defaultHeight,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 4,
            offset: Offset(1, 3),
          ),
        ], color: Color(0xffFF6366), borderRadius: BorderRadius.circular(90)),
      ),
    );
  }
}
