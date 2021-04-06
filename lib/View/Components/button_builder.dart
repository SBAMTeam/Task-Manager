import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/constants.dart';

class ButtonBuilder extends StatelessWidget {
  final VoidCallback onPress;
  final text, textColor, fontWeight, width, edge, color;
  final double height;
  final double fontSize;

  /// for custom child use child property. All other properties have no effect on the new child.
  final child;

  ///boxDecoration: BoxDecoration(), for no decoration.
  final boxDecoration;
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
    this.boxDecoration,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress ?? () {},
      child: child ??
          Container(
            alignment: Alignment.center,
            // child: Center(
            child: Text(
              text ?? 'PLACEHOLDER',
              style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: fontSize ?? 18,
                  fontWeight: FontWeight.w600),
            ),
            // ),
            width: width ?? Get.width / 2.5,
            height: height ?? defaultHeight,
            decoration: boxDecoration ??
                BoxDecoration(
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black.withOpacity(0.15),
                  //     blurRadius: 4,
                  //     offset: Offset(1, 3),
                  //   ),
                  // ],
                  color: color ?? Color(buttonColorOne),
                  borderRadius: BorderRadius.circular(edge ?? 9),
                ),
          ),
    );
  }
}
