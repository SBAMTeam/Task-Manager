import 'package:flutter/material.dart';
import 'Constants.dart';

class TextBuilder extends StatelessWidget {
  final text, color, fontWeight;
  final decoration;
  final fontFamily;
  final fontStyle;
  final textAlign;
  final double fontSize;
  const TextBuilder(
      {Key key,
      this.text,
      this.color,
      this.fontWeight,
      this.fontSize,
      this.decoration,
      this.fontFamily,
      this.fontStyle,
      this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? 'PLACEHOLDER',
      textAlign: textAlign ?? TextAlign.left,
      style: TextStyle(
          //letterSpacing: 1,
          fontSize: fontSize ?? 43.5,
          fontWeight: fontWeight ?? FontWeight.w300,
          color: color ?? Color(textColor),
          decoration: decoration ?? null,
          fontFamily: fontFamily ?? 'Nunito',
          fontStyle: fontStyle ?? FontStyle.normal),
    );
  }
}
