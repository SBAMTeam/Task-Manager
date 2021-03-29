import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/user_controller.dart';
import 'package:taskmanager/Models/Usermodel.dart';
import 'package:taskmanager/View/Components/button_builder.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Components/TextFieldBuilder.dart';
import 'package:crypto/crypto.dart';
import 'package:taskmanager/View/Components/transparent_app_bar.dart';
import 'registration_complete.dart';
import 'dart:convert';

class Register extends StatelessWidget {
  Register({Key key}) : super(key: key);
  final Usermodel usermodel = Usermodel();
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                    icon: Icons.person,
                    hint: 'Username',
                    onSavedFunc: (value) {
                      usermodel.userName = value.trim();
                    },
                    // /^[a-zA-Z0-9.\-_$@*!]{3,30}$/
                    validatorFunction: (String value) {
                      if (value.isEmpty) {
                        return 'Username must be longer than 3 charachters characters';
                      }
                      if (!RegExp(r"^\S+\w{3,32}\S{1,}").hasMatch(value)) {
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
                      if (value.length < 3) {
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
                      if (value.isEmpty ||
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
                      passwordOne = value;
                      if (value.isEmpty ||
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
                      passwordTwo = value;
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
                        try {
                          final result =
                              await InternetAddress.lookup('example.com');
                          if (result.isNotEmpty &&
                              result[0].rawAddress.isNotEmpty) {
                            print('Connected to internet');
                          }
                        } on SocketException catch (_) {
                          Fluttertoast.showToast(
                              msg: "Check your internet connection",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        print(usermodel.toJson());
                        final data = await (UserController.register(usermodel));
                        if (data == 200) {
                          Get.off(() => RegistrationComplete());
                        } else if (data == 404) {
                          Fluttertoast.showToast(
                              msg: "Server Error. Sorry!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 2,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
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
