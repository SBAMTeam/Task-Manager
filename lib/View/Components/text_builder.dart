import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class TextBuilder extends StatelessWidget {
  final text, color, fontWeight;
  final decoration;
  final fontFamily;
  final fontStyle;
  final textAlign;
  final minLines;
  final maxLines;
  final double scale;
  final double minFontSize;
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
      this.textAlign,
      this.minLines,
      this.maxLines,
      this.minFontSize,
      this.scale})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text ?? 'PLACEHOLDER',
      textAlign: textAlign ?? TextAlign.left,
      maxLines: maxLines ?? null,
      minFontSize: minFontSize ?? 16,
      wrapWords: true,
      textScaleFactor: scale ?? 0.86,
      // stepGranularity: ,
      style: TextStyle(
          //letterSpacing: 1,
          fontSize: fontSize ?? 40,
          fontWeight: fontWeight ?? FontWeight.w300,
          color: color ?? Color(textColor),
          decoration: decoration ?? null,
          fontFamily: fontFamily ?? 'Nunito',
          fontStyle: fontStyle ?? FontStyle.normal),
    );
  }
}
