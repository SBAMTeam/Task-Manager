import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'Backbutton.dart';

class TransparentAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  TransparentAppBar({Key key, this.onPress}) : super(key: key);
  final onPress;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      leading: Backbutton(
        onPress: onPress,
      ),
    );
  }

  @override
  @override
  final Size preferredSize = Size.fromHeight(Get.height / 15);
}
