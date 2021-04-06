import 'package:flutter/material.dart';
import 'constants.dart';

class TextFieldBuilder extends StatefulWidget {
  TextFieldBuilder({
    Key key,
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
    this.initialValue,
    this.onSavedFunc,
    this.autoValidateMode,
    this.autoFocus,
  }) : super(key: key);
  final IconData icon;
  final String hint;
  final bool obscure;
  final height, fontSize, iconSize, fillColor, hintFontSize;
  final iconColor;
  final validatorFunction;
  final textInputType;
  final initialValue;
  final onSavedFunc;
  final autoFocus;
  final autoValidateMode;
  @override
  _TextFieldBuilderState createState() => _TextFieldBuilderState();
}

class _TextFieldBuilderState extends State<TextFieldBuilder> {
  var _data;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(9),
        child: Container(
          child: TextFormField(
            autofocus: widget.autoFocus ?? false,
            autovalidateMode:
                widget.autoValidateMode ?? AutovalidateMode.onUserInteraction,
            initialValue: widget.initialValue ?? null,
            keyboardType: widget.textInputType ?? null,
            onSaved: widget.onSavedFunc ??
                (String value) {
                  _data = value.trim();
                  if (widget.hint != password &&
                      widget.hint != 'Confirm Password') {
                    print('${widget.hint} is $_data');
                  }
                },
            validator: widget.validatorFunction,
            style: TextStyle(
              color: Color(textColor),
              fontSize: widget.fontSize ?? 18,
            ),
            obscureText: widget.obscure ?? false,
            decoration: InputDecoration(
              errorMaxLines: 3,
              // helperText: '',
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
                height: widget.height ?? 0.9,
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
