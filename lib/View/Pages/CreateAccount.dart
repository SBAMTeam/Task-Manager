import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Models/Usermodel.dart';
import 'package:taskmanager/View/Components/ButtonBuiler.dart';
import 'package:taskmanager/View/Components/Constants.dart';
import 'package:taskmanager/View/Components/TextBuilder.dart';
import 'package:taskmanager/View/Components/TextFieldBuilder.dart';
import 'package:crypto/crypto.dart';
import 'ServerCodeCreated.dart';
import 'dart:convert';

class CreateAccount extends StatelessWidget {
  CreateAccount({Key key}) : super(key: key);
  final Usermodel usermodel = Usermodel();
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    var passwordOne, passwordTwo;

    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width / 12, vertical: Get.height / 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFieldBuilder(
                    icon: Icons.person,
                    hint: 'Username',
                    onSavedFunc: (value) {
                      usermodel.username = value.trim();
                    },
                    validatorFunction: (String value) {
                      if (value.length < 5) {
                        return 'Username must be longer than 5 characters';
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
                      usermodel.nickname = value.trim();
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
                      usermodel.email = value.trim();
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
                      var digest = md5.convert(bytes).toString();
                      print('password hash is : $digest');
                      usermodel.userhash = digest;
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
                      text: 'Create Account',
                      onPress: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        Get.to(() => ServerCodeCreated());
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
