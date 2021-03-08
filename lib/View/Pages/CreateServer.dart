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
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: Get.width / 12, vertical: Get.height / 13),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/CreateServerImage.png',
                      scale: 3.2,
                    ),
                  ),
                  SizedBox(
                    height: sizedBoxBigSpace,
                  ),
                  TextBuilder(
                    text: 'Server Info',
                    fontSize: 41,
                  ),
                  SizedBox(
                    height: sizedBoxSmallSpace,
                  ),
                  TextFieldBuilder(
                    icon: Icons.dns,
                    hint: 'Server Name',
                    validatorFunction: (String value) {
                      if (value.isEmpty) {
                        return 'Server Name is required.';
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
                    hint: '$phone (+963..)',
                    icon: Icons.phone,
                    textInputType: TextInputType.phone,
                    validatorFunction: (String value) {
                      if (value.isEmpty ||
                          !RegExp(r'^\+[1-9]{1}[0-9]{3,14}$')
                              .hasMatch(value.trim())) {
                        return 'Please enter a valid $phone with correct country code.';
                      }
                    },
                  ),
                  SizedBox(
                    height: sizedBoxSmallSpace,
                  ),
                  SizedBox(
                    height: sizedBoxSmallSpace,
                  ),
                  Center(
                    child: ButtonBuilder(
                      text: 'Create Server',
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