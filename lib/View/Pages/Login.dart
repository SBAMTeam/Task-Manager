import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/Usercontroller.dart';
import 'package:taskmanager/Models/Usermodel.dart';
import 'package:taskmanager/View/Components/ButtonBuiler.dart';
import 'package:taskmanager/View/Components/TextBuilder.dart';
import 'package:taskmanager/View/Components/TextFieldBuilder.dart';
import 'package:taskmanager/View/Components/Constants.dart';
import 'package:crypto/crypto.dart';
import 'package:taskmanager/View/Components/TransparentAppBar.dart';
import 'package:taskmanager/View/Pages/LoggedInPage.dart';

import 'Register.dart';

class Login extends StatelessWidget {
  final Usermodel usermodel = Usermodel();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: TransparentAppBar(),
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 12),
            // , vertical: Get.height / 13),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/signin_image_dark.png'),
                  SizedBox(
                    height: Get.height / 30,
                  ),
                  Row(
                    children: [
                      TextBuilder(text: 'Login'),
                    ],
                  ),
                  SizedBox(
                    height: Get.height / 30,
                  ),
                  TextFieldBuilder(
                    hint: 'Username',
                    onSavedFunc: (String value) {
                      usermodel.username = value;
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
                    height: Get.height / 60,
                  ),
                  TextFieldBuilder(
                    hint: password,
                    onSavedFunc: (String value) {
                      var bytes = utf8.encode(value.trim());
                      var digest = sha256.convert(bytes).toString();
                      print("$digest");
                      usermodel.userhash = digest;
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
                      if (tmp != 200) {
                        print(tmp);
                        Get.off(LoggedInPage());
                        tmp = null;
                        return;
                      }
                    },
                  ),
                  SizedBox(
                    height: Get.height / 5.8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        ),
                      ),
                    ],
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
