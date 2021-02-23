import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/ButtonBuiler.dart';
import 'package:taskmanager/View/Components/Constants.dart';
import 'package:taskmanager/View/Components/TextBuilder.dart';
import 'package:taskmanager/View/Components/TextFieldBuilder.dart';
import 'package:taskmanager/View/Pages/ServerCodeCreated.dart';

class CreateServer extends StatelessWidget {
  const CreateServer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width / 8, vertical: Get.height / 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/CreateServerImage.png',
                    scale: 2.8,
                  ),
                ),
                SizedBox(
                  height: sizedBoxBigSpace,
                ),
                TextBuilder(
                  text: 'Server Info:',
                  fontSize: 41,
                ),
                SizedBox(
                  height: sizedBoxSmallSpace,
                ),
                TextFieldBuilder(
                  icon: Icons.dns,
                  hint: 'Server Name',
                ),
                SizedBox(
                  height: sizedBoxSmallSpace,
                ),
                TextFieldBuilder(
                  hint: email,
                  icon: Icons.email,
                ),
                SizedBox(
                  height: sizedBoxSmallSpace,
                ),
                TextFieldBuilder(
                  hint: 'Phone Number',
                  icon: Icons.phone,
                ),
                SizedBox(
                  height: sizedBoxSmallSpace,
                ),
                TextBuilder(
                  text: 'SuperUser Info:',
                  fontSize: 41,
                ),
                SizedBox(
                  height: sizedBoxSmallSpace,
                ),
                TextFieldBuilder(
                  icon: Icons.account_circle,
                  hint: 'Username',
                ),
                SizedBox(
                  height: sizedBoxSmallSpace,
                ),
                TextFieldBuilder(
                  hint: password,
                  icon: Icons.lock,
                ),
                SizedBox(
                  height: sizedBoxSmallSpace,
                ),
                Center(
                  child: ButtonBuilder(
                    text: 'Create Server',
                    onPress: () {
                      Get.to(ServerCodeCreated());
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
