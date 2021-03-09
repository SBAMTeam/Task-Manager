import 'package:flutter/material.dart';
import 'Constants.dart';

class TextBuilder extends StatelessWidget {
  final text, color, fontWeight;
  final decoration;
  final fontFamily;
  final fontStyle;
  final double fontSize;
  const TextBuilder(
      {Key key,
      this.text,
      this.color,
      this.fontWeight,
      this.fontSize,
      this.decoration,
      this.fontFamily,
      this.fontStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? 'PLACEHOLDER',
      textAlign: TextAlign.left,
      style: TextStyle(
          fontSize: fontSize ?? 43.5,
          fontWeight: fontWeight ?? FontWeight.w300,
          color: color ?? Color(textColor),
          decoration: decoration ?? null,
          fontFamily: fontFamily ?? 'Nunito',
          fontStyle: fontStyle ?? FontStyle.normal),
    );
  }
}
