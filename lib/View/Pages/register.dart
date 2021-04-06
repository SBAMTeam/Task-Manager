import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/user_controller.dart';
import 'package:taskmanager/Models/user_model.dart';
import 'package:taskmanager/View/Components/button_builder.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Components/TextFieldBuilder.dart';
import 'package:crypto/crypto.dart';
import 'package:taskmanager/View/Components/functions.dart';
import 'package:taskmanager/View/Components/transparent_app_bar.dart';
import 'registration_complete.dart';
import 'dart:convert';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class Register extends StatelessWidget {
  Register({Key key}) : super(key: key);
  final Usermodel usermodel = Usermodel();
  @override
  Widget build(BuildContext context) {
    var passwordOne, passwordTwo;
    return Scaffold(
      appBar: TransparentAppBar(),
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 12),
              // , vertical: Get.height / 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldBuilder(
                    autoFocus: true,
                    icon: Icons.person,
                    hint: 'Username',
                    onSavedFunc: (value) {
                      usermodel.userName = value.trim();
                    },
                    // /^[a-zA-Z0-9.\-_$@*!]{3,30}$/
                    validatorFunction: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Username must be longer than 3 characters';
                      } else if (!RegExp(r"^\S+\w{1,32}\S{1,}")
                          .hasMatch(value.trim())) {
                        return "Username can only contain characters, numbers, underscores\nand more than 3 characters.";
                      }
                    },
                  ),
                  SizedBox(
                    height: sizedBoxSmallSpace,
                  ),
                  TextFieldBuilder(
                    icon: Icons.badge,
                    hint: 'Nickname',
                    onSavedFunc: (value) {
                      usermodel.userNickname = value.trim();
                    },
                    validatorFunction: (String value) {
                      if (value.trim().length < 3) {
                        return 'Nickname must be longer than 3 characters';
                      }
                    },
                  ),
                  SizedBox(
                    height: sizedBoxSmallSpace,
                  ),
                  TextFieldBuilder(
                    hint: email,
                    icon: Icons.email,
                    textInputType: TextInputType.emailAddress,
                    onSavedFunc: (value) {
                      usermodel.userEmail = value.trim();
                    },
                    validatorFunction: (String value) {
                      if (value.trim().isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Please enter a valid $email.';
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
                      print('password hash is : $digest');
                      usermodel.userHash = digest;
                    },
                    icon: Icons.lock,
                    obscure: true,
                    textInputType: TextInputType.visiblePassword,
                    validatorFunction: (String value) {
                      passwordOne = value.trim();
                      if (value.trim().isEmpty ||
                          !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})')
                              .hasMatch(value.trim())) {
                        return 'Password must contain uppercase and smallcase letters,\n special characters, and numbers.';
                      }
                    },
                  ),
                  SizedBox(
                    height: sizedBoxSmallSpace,
                  ),
                  TextFieldBuilder(
                    hint: 'Confirm $password',
                    icon: Icons.lock,
                    obscure: true,
                    textInputType: TextInputType.visiblePassword,
                    validatorFunction: (String value) {
                      passwordTwo = value.trim();
                      if (passwordOne != passwordTwo) {
                        return 'Passwords do not match';
                      }
                    },
                  ),
                  SizedBox(
                    height: sizedBoxSmallSpace,
                  ),
                  Center(
                    child: ButtonBuilder(
                      height: 50.0,
                      text: 'Register',
                      onPress: () async {
                        if (await checkInternetConnection() == false) {
                          return;
                        }
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        print(usermodel.toJson());
                        final data = await (UserController.register(usermodel));
                        if (data == 200) {
                          Get.offAll(() => RegistrationComplete());
                        } else if (data == 404) {
                          showSnackBar("Server Error. Sorry!");
                        }
                      },
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
