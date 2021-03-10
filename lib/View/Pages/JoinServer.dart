import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/ButtonBuiler.dart';
import 'package:taskmanager/View/Components/TextBuilder.dart';
// ignore: unused_import
import 'package:taskmanager/View/Components/TextFieldBuilder.dart';
import 'package:taskmanager/View/Components/Constants.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:taskmanager/View/Components/TransparentAppBar.dart';

class JoinServer extends StatelessWidget {
  const JoinServer({Key key}) : super(key: key);

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
                    height: sizedBoxBigSpace,
                  ),
                  Row(
                    children: [
                      TextBuilder(
                        text: 'Join Server',
                        fontSize: 40,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w100,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height / 30,
                  ),
                  GetBuilder(
                    builder: (GetxController controller) {
                      return PinCodeTextField(
                        defaultBorderColor: Color(buttonColorTwo),
                        keyboardType: TextInputType.text,
                        autofocus: true,
                        maxLength: 6,
                        highlight: true,
                        pinBoxColor: Color(buttonColorTwo),
                        highlightPinBoxColor: Color(buttonColorOne),
                        highlightAnimation: true,
                        pinBoxRadius: 9.0,
                        highlightAnimationEndColor: Colors.transparent,
                        hasTextBorderColor: Colors.transparent,
                        pinBoxDecoration:
                            ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                        onTextChanged: (text) =>
                            {text = text.toUpperCase(), print(text)},
                        pinTextStyle:
                            TextStyle(color: Color(0xffF1F1F1), fontSize: 23),
                        pinBoxHeight: 45,
                        pinBoxWidth: 45,
                        onDone: (text) {/*send to databse */},
                      );
                    },
                  ),
                  SizedBox(
                    height: sizedBoxSmallSpace,
                  ),
                  SizedBox(height: sizedBoxSmallSpace),
                  ButtonBuilder(
                    text: 'Join',
                    fontSize: 23.0,
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
