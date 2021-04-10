import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/user_controller.dart';
import 'package:taskmanager/View/Components/constants.dart';

class UserInfoBar extends GetView<UserController> {
  const UserInfoBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: Get.width / 16, vertical: Get.height / 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
                text: controller.username.value,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 30),
                children: [
                  TextSpan(
                    text: '\nrole/job title',
                    style: TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 20),
                  ),
                ]),
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
