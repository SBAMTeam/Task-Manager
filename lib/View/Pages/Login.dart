import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/ButtonBuiler.dart';
import 'package:taskmanager/View/Components/TextBuilder.dart';
import 'package:taskmanager/View/Components/TextFieldBuilder.dart';
import 'package:taskmanager/View/Components/Constants.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _emailAddress = null,
      _password = null,
      _companyCode = null,
      _enabled = true;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width / 12, vertical: Get.height / 13),
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
                  SizedBox(
                    height: Get.height / 200,
                  ),

                  // PinCodeTextField(
                  //   enabled: _enabled,
                  //   validator: (value) {
                  //     if (value.length < 6) {
                  //       return 'Please enter a valid code';
                  //     } else
                  //       return null;
                  //   },
                  //   onSaved: (value) {
                  //     _companyCode = value;
                  //     print(_companyCode);
                  //   },
                  //   boxShadows: [
                  //     BoxShadow(
                  //         color: Colors.black.withOpacity(0.15),
                  //         blurRadius: 4,
                  //         offset: Offset(1, 3))
                  //   ],
                  //   enableActiveFill: true,
                  //   length: 6,
                  //   backgroundColor: Colors.black.withOpacity(0),
                  //   obscureText: false,
                  //   textStyle: TextStyle(
                  //     color: Color(0xff3F3D56),
                  //   ),
                  //   pinTheme: PinTheme(
                  //     selectedFillColor: Colors.white,
                  //     selectedColor: Color(0xffFF6366),
                  //     activeFillColor: Colors.white,
                  //     inactiveFillColor: Colors.white,
                  //     inactiveColor: Colors.white,
                  //     activeColor: Color(0xff3F3D56),
                  //     shape: PinCodeFieldShape.box,
                  //     borderRadius: BorderRadius.circular(90),
                  //     fieldHeight: 50,
                  //     fieldWidth: 42,
                  //   ),
                  //   appContext: context,
                  //   onChanged: (String value) {
                  //     if (value.length > 5) {
                  //       _companyCode = value;
                  //       setState(() {
                  //         _enabled = false;
                  //       });
                  //     }
                  //   },
                  // ),

                  SizedBox(height: sizedBoxSmallSpace),
                  ButtonBuilder(
                    height: 50.0,
                    text: 'Login',
                    onPress: () {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
