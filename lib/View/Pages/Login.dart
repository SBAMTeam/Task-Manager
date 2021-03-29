import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/Usercontroller.dart';
import 'package:taskmanager/Database/_db_functions.dart';
import 'package:taskmanager/Models/Usermodel.dart';
import 'package:taskmanager/View/Components/button_builder.dart';
import 'package:taskmanager/View/Components/text_builder.dart';
import 'package:taskmanager/View/Components/TextFieldBuilder.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:crypto/crypto.dart';
import 'package:taskmanager/View/Components/transparent_app_bar.dart';
import 'package:taskmanager/View/Pages/logged_in_page.dart';
import 'register.dart';

class Login extends StatelessWidget {
  final Usermodel usermodel = Usermodel();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Get.height - (Get.statusBarHeight + 15),

            padding: EdgeInsets.only(
                left: horizontalPadding,
                right: horizontalPadding,
                top: Get.height / 15),
            // , vertical: Get.height / 13),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/signin_image_dark.png'),
                  SizedBox(
                    height: sizedBoxBigSpace,
                  ),
                  Row(
                    children: [
                      TextBuilder(text: 'Login'),
                    ],
                  ),
                  SizedBox(
                    height: sizedBoxBigSpace,
                  ),
                  TextFieldBuilder(
                    hint: 'Username',
                    onSavedFunc: (String value) {
                      usermodel.userName = value;
                    },
                    icon: Icons.person,
                    textInputType: TextInputType.text,
                    validatorFunction: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter your username.';
                      }
                    },
                  ),
                  SizedBox(
                    height: sizedBoxSmallSpace,
                  ),
                  TextFieldBuilder(
                    hint: password,
                    onSavedFunc: (String value) {
                      var bytes = utf8.encode(value.trim());
                      var digest = sha256.convert(bytes).toString();
                      // print("$digest");
                      usermodel.userHash = digest;
                    },
                    icon: Icons.lock,
                    obscure: true,
                    textInputType: TextInputType.visiblePassword,
                    validatorFunction: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter a $password';
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Color(
                                textColor,
                              ),
                              fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: sizedBoxSmallSpace),
                  ButtonBuilder(
                    height: 50.0,
                    text: 'Login',
                    onPress: () async {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();
                      var tmp = await (UserController.login(usermodel));
                      if (!(tmp is int)) {
                        Usermodel u = usermodelFromJson(tmp);
                        // print(u.toJson());
                        // print(u.userServers.toList().toString());
                        await DBFunctions.insertUserAndServer(u);
                        print(await DBFunctions.getAllDetails());

                        Get.off(() => LoggedInPage());
                        tmp = null;
                        return;
                      } else {
                        print("Error code: $tmp");
                      }
                    },
                  ),
                  // SizedBox(
                  //   height: sizedBoxBigSpace,
                  // ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Don't have an account?",
                              style: TextStyle(
                                  color: Colors.white.withAlpha(127),
                                  fontWeight: FontWeight.w600),
                            ),
                            ButtonBuilder(
                              onPress: () {
                                Get.to(() => Register());
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(fontWeight: FontWeight.w600),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
