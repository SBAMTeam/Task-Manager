import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager/View/Components/ButtonBuiler.dart';
import 'package:taskmanager/View/Components/TextBuilder.dart';
import 'package:taskmanager/View/Components/TextFieldBuilder.dart';
import 'package:taskmanager/View/Components/Constants.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width / 8, vertical: Get.height / 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/signin_image.png'),
                SizedBox(
                  height: Get.height / 30,
                ),
                Row(
                  children: [
                    TextBuilder(text: 'Sign In:'),
                  ],
                ),
                SizedBox(
                  height: Get.height / 30,
                ),
                TextFieldBuilder(
                  icon: Icons.email,
                  hint: 'Email Address',
                ),
                SizedBox(
                  height: Get.height / 60,
                ),
                TextFieldBuilder(
                  icon: Icons.lock,
                  hint: 'Password',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color(
                            textColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Get.height / 60,
                ),
                Text(
                  'Enter code provided by your company',
                  style: TextStyle(color: Color(textColor), fontSize: 18),
                ),
                SizedBox(
                  height: Get.height / 60,
                ),
                PinCodeTextField(
                  boxShadows: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        blurRadius: 4,
                        offset: Offset(1, 3))
                  ],
                  enableActiveFill: true,
                  length: 6,
                  backgroundColor: Colors.black.withOpacity(0),
                  obscureText: false,
                  textStyle: TextStyle(
                    color: Color(0xff3F3D56),
                  ),
                  pinTheme: PinTheme(
                    selectedFillColor: Colors.white,
                    selectedColor: Color(0xffFF6366),
                    activeFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    inactiveColor: Colors.white,
                    activeColor: Color(0xff3F3D56),
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(90),
                    fieldHeight: 50,
                    fieldWidth: 42,
                  ),
                  appContext: context,
                  onChanged: (String value) {},
                ),
                SizedBox(
                  height: Get.height / 60,
                ),
                ButtonBuilder(
                  text: 'Login',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
