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
      this.iconColor,
      this.validatorFunction,
      this.textInputType,
      this.initialValue})
      : super(key: key);
  final IconData icon;
  final String hint;
  final bool obscure;
  final height, fontSize, iconSize, fillColor, hintFontSize;
  final iconColor;
  final validatorFunction;
  final textInputType;
  final initialValue;
  @override
  _TextFieldBuilderState createState() => _TextFieldBuilderState();
}

class _TextFieldBuilderState extends State<TextFieldBuilder> {
  var _data;
  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration:
      //     BoxDecoration(borderRadius: BorderRadius.circular(90), boxShadow: [
      //   BoxShadow(
      //     color: Colors.black.withOpacity(0.15),
      //     blurRadius: 4,
      //     offset: Offset(1, 3),
      //   )
      // ]),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 4,
                  offset: Offset(1, 3),
                )
              ]),
          child: TextFormField(
            initialValue: widget.initialValue ?? null,
            keyboardType: widget.textInputType ?? null,
            onSaved: (String value) {
              _data = value.trim();
              print('${widget.hint} is $_data');
            },
            validator: widget.validatorFunction,
            style: TextStyle(
              color: Color(textColor),
              fontSize: widget.fontSize ?? 18,
            ),
            obscureText: widget.obscure ?? false,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 1.0),
              prefixIcon: Icon(
                widget.icon ?? Icons.error,
                size: widget.iconSize ?? 35,
                color: widget.iconColor ?? Color(iconColor),
              ),
              filled: true,
              fillColor: Color(textFieldColor),
              hintText: widget.hint ?? placeholder,
              hintStyle: TextStyle(
                color: Color(textColor),
                fontSize: widget.fontSize ?? 18,
                height: 0.9,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(9),
              ),
              focusColor: Color(textFieldColor),
            ),
          ),
        ),
      ),
    );
  }
}
