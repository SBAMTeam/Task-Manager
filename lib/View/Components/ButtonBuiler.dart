import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/Constants.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/ServerCodeCreated.dart';

class ButtonBuilder extends StatelessWidget {
  final VoidCallback onPress;
  final text, textColor, fontWeight, width, height, edge, color, fontSize;
  const ButtonBuilder({
    Key key,
    this.text,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.width,
    this.height,
    this.onPress,
    this.edge,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress ?? () {},
      child: Container(
        child: Center(
          child: Text(
            text ?? 'PLACEHOLDER',
            style: TextStyle(
                color: textColor ?? Colors.white,
                fontSize: fontSize ?? 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        width: width ?? Get.width / 2.5,
        height: height ?? defaultHeight,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 4,
              offset: Offset(1, 3),
            ),
          ],
          color: color ?? Color(buttonColorOne),
          borderRadius: BorderRadius.circular(edge ?? 9),
        ),
      ),
    );
  }
}
