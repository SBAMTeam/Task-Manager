import 'package:flutter/material.dart';

class TextField_Builder extends StatefulWidget {
  TextField_Builder({Key key, this.icon, this.hint, this.obscure})
      : super(key: key);
  final Icon icon;
  final String hint;
  final bool obscure;

  @override
  _TextField_BuilderState createState() => _TextField_BuilderState();
}

class _TextField_BuilderState extends State<TextField_Builder> {
  @override
  Widget build(BuildContext context) {
    var iconColor = 0xff3F3D56;
    var textColor = 0xff3F3D56;
    return Container(
      height: 47,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(90),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 4,
                offset: Offset(1, 3))
          ]),
      child: TextFormField(
        obscureText: widget.obscure ?? false,
        decoration: InputDecoration(
            prefixIcon: widget.icon ??
                Icon(
                  Icons.email,
                  size: 35,
                  color: Color(iconColor),
                ),
            filled: true,
            fillColor: Colors.white,
            hintText: widget.hint ?? 'Email Address',
            hintStyle: TextStyle(
              color: Color(textColor),
              fontSize: 18,
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
