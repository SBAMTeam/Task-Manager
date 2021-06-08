import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/user_controller.dart';
import 'package:taskmanager/View/Components/constants.dart';

class UserInfoBar extends GetView<UserController> {
  const UserInfoBar({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(
      //   horizontal: Get.width / 20,
      // ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     Container(
          //       height: 20,
          //       child: Flexible(
          //         child: AutoSizeText(
          //           "${controller.username.value}",
          //           maxFontSize: 50,
          //           minFontSize: 20,
          //         ),
          //       ),
          //     ),
          //     Container(
          //       height: 20,
          //       child: Flexible(
          //         child: AutoSizeText(
          //           "${controller.nickname.value}",
          //           maxFontSize: 50,
          //           minFontSize: 20,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

          AutoSizeText.rich(
            TextSpan(
              text: controller.username.value,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
              children: [
                TextSpan(
                  text: "\n${controller.nickname.value}",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
                ),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(9.0), //or 15.0
            child: Container(
              height: 60.0,
              width: 60.0,
              color: Color(buttonColorOne),
            ),
          ),
        ],
      ),
    );
  }
}
