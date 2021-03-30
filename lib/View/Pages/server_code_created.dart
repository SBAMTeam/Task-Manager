import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/button_builder.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Components/text_builder.dart';
import 'package:flutter/services.dart';
import 'package:taskmanager/Database/db_functions.dart';

class ServerCodeCreated extends StatelessWidget {
  final serverCode;
  // final serverName;
  const ServerCodeCreated({Key key, this.serverCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width / 15, vertical: Get.height / 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_outline,
                  size: 180.0,
                  color: Colors.white,
                ),
                // Center(
                //   child: Image.asset(
                //     'assets/images/Lock.png',
                //     scale: 2.5,
                //   ),
                // ),
                SizedBox(
                  height: sizedBoxBigSpace,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: "This is your server's special",
                          style: TextStyle(
                              color: Color(textColor),
                              fontSize: 30,
                              fontWeight: FontWeight.normal),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' code',
                              style: TextStyle(
                                  color: Color(textColorSecondary),
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizedBoxBigSpace,
                    ),
                    TextBuilder(
                      textAlign: TextAlign.center,
                      text: serverCode,
                      fontFamily: 'Opensans',
                      color: Color(buttonColorOne),
                      fontSize: 80,
                      decoration: TextDecoration.underline,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: '\nUsers will use this code to join your server',
                        style: TextStyle(color: Color(textColor), fontSize: 20),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: sizedBoxBigSpace,
                ),
                ButtonBuilder(
                  text: 'Copy to Clipboard',
                  onPress: () {
                    Clipboard.setData(new ClipboardData(
                        text: serverCode)); //service to copy to clipboard
                  },
                ),
                ButtonBuilder(text: "Join $placeholder")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
