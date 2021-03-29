import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/ServerController.dart';
import 'package:taskmanager/Database/_db_functions.dart';
import 'package:taskmanager/Models/Servermodel.dart';
import 'package:taskmanager/Models/Usermodel.dart';
import 'package:taskmanager/View/Components/button_builder.dart';
import 'package:taskmanager/View/Components/text_builder.dart';
import 'server_page.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:taskmanager/View/Components/transparent_app_bar.dart';

class JoinServer extends StatelessWidget {
  const JoinServer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final Servermodel servermodel = Servermodel();
    final Usermodel usermodel = Usermodel();
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
                      var controller = TextEditingController();

                      return GestureDetector(
                        onLongPress: () async {
                          showDialog(
                              context: Get.context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Paste code?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () async {
                                          controller?.text =
                                              await FlutterClipboard.paste();
                                          servermodel.serverCode =
                                              controller.text.toUpperCase();
                                          Get.back();
                                          FocusScope.of(context).unfocus();
                                        },
                                        child: Text("OK"))
                                  ],
                                );
                              });
                        },
                        child: PinCodeTextField(
                          controller: controller,
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
                          onDone: (text) {
                            servermodel.serverCode = text;
                          },
                        ),
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
                    onPress: () async {
                      if (!_formKey.currentState.validate()) {
                        return;
                      }
                      _formKey.currentState.save();

                      usermodel.userId =
                          (await DBFunctions.getUserIdInteger()).toString();

                      if (await ServerController.joinServer(
                              servermodel, usermodel) ==
                          200) {
                        Get.off(() => HomePage());
                      }
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

// pasteDialog(TextEditingController controller) {
//   return
// }
