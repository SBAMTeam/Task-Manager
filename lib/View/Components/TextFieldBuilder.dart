import 'package:flutter/material.dart';
import 'Constants.dart';

class TextFieldBuilder extends StatefulWidget {
  TextFieldBuilder(
      {Key key,
      this.icon,
      this.hint,
      this.obscure,
      this.height,
      this.fontSize,
      this.iconSize,
      this.fillColor,
      this.hintFontSize,
      this.iconColor})
      : super(key: key);
  final IconData icon;
  final String hint;
  final bool obscure;
  final height, fontSize, iconSize, fillColor, hintFontSize;
  final iconColor;
  @override
  _TextFieldBuilderState createState() => _TextFieldBuilderState();
}

class _TextFieldBuilderState extends State<TextFieldBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? defaultHeight,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(90), boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          blurRadius: 4,
          offset: Offset(1, 3),
        )
      ]),
      child: TextFormField(
        style: TextStyle(
          color: Color(textColor),
          fontSize: widget.fontSize ?? 18,
        ),
        obscureText: widget.obscure ?? false,
        decoration: InputDecoration(
            prefixIcon: Icon(
              widget.icon ?? Icons.error,
              size: widget.iconSize ?? 35,
              color: widget.iconColor ?? Color(iconColor),
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: widget.hint ?? 'PLACEHOLDER',
            hintStyle: TextStyle(
              color: Color(textColor),
              fontSize: widget.fontSize ?? 18,
              height: 0.9,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(90),
            ),
            focusColor: Colors.white),
      ),
    );
  }
}
