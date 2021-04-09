import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/user_controller.dart';
import 'package:taskmanager/Models/user_model.dart';
import 'package:taskmanager/View/Components/button_builder.dart';
import 'package:taskmanager/View/Components/functions.dart';
import 'package:taskmanager/View/Components/text_builder.dart';
import 'package:taskmanager/View/Components/TextFieldBuilder.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:crypto/crypto.dart';
import 'package:taskmanager/View/Pages/logged_in_page.dart';
import 'register.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _formKey;
  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  final Usermodel usermodel = Usermodel();
  final controller = Get.find<UserController>();
  final maxheight = Get.height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          padding: EdgeInsets.only(
            left: horizontalPadding,
            right: horizontalPadding,
            top: statusBarHeight * 2,
          ),
          // , vertical: Get.height / 13),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset('assets/images/signin_image_dark.png'),
                    SizedBox(
                      height: maxheight / 25,
                    ),
                    Row(
                      children: [
                        TextBuilder(text: 'Login'),
                      ],
                    ),
                    SizedBox(
                      height: maxheight / 25,
                    ),
                    Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextFieldBuilder(
                          autoValidateMode: null,
                          hint: 'Username',
                          onSavedFunc: (String value) {
                            usermodel.userName = value.trim();
                          },
                          icon: Icons.person,
                          textInputType: TextInputType.text,
                          validatorFunction: (String value) {
                            if (value.trim().isEmpty) {
                              return "Username can't be empty";
                            }
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFieldBuilder(
                          autoValidateMode: null,
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
                            if (value.trim().isEmpty) {
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
                        ButtonBuilder(
                          height: 50.0,
                          text: 'Login',
                          onPress: () async {
                            if (await checkInternetConnection() == false) {
                              return;
                            }

                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            _formKey.currentState.save();
                            controller.login(usermodel);
                            Get.offAll(() => LoggedInPage());

                            return;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
