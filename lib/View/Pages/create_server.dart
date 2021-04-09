import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taskmanager/Controllers/server_controller.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/Models/server_model.dart';
import 'package:taskmanager/Models/user_model.dart';

import 'package:taskmanager/View/Components/button_builder.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Components/functions.dart';
import 'package:taskmanager/View/Components/server_code_generator.dart';
import 'package:taskmanager/View/Components/text_builder.dart';
import 'package:taskmanager/View/Components/TextFieldBuilder.dart';
import 'package:taskmanager/View/Components/transparent_app_bar.dart';
import 'package:taskmanager/View/Pages/server_code_created.dart';
import 'package:taskmanager/Database/database.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class CreateServer extends GetView<ServerController> {
  CreateServer({Key key}) : super(key: key);
  final Servermodel servermodel = Servermodel();
  final Usermodel usermodel = Usermodel();
  @override
  Widget build(BuildContext context) {
    var serverCode;
    return Scaffold(
      appBar: TransparentAppBar(),
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 12),
            // , vertical: Get.height / 13),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/createserver_image.png',
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
                    onSavedFunc: (value) {
                      servermodel.serverName = value.trim();
                    },
                    validatorFunction: (String value) {
                      if (value.trim().isEmpty) {
                        return 'Server Name is required.';
                      } else if (value.trim().length > 50) {
                        return 'Value is too long!';
                      }
                    },
                  ),
                  SizedBox(
                    height: sizedBoxSmallSpace,
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
                      onPress: () async {
                        if (await checkInternetConnection() == false) {
                          return;
                        }
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        var userDao =
                            Provider.of<UserDao>(context, listen: false);
                        var userData = await userDao.getUserData();
                        serverCode = getRandomString(6);
                        servermodel.serverCode = serverCode;
                        usermodel.userId = userData[0].userId.toString();
                        servermodel.serverOwnerId = usermodel.userId;
                        _formKey.currentState.save();
                        var statusCode =
                            await controller.createServer(servermodel);
                        if (statusCode == 200) {
                          controller.fetchServers();
                        } else {
                          print("API Error, status code : $statusCode");
                        }
                        Get.off(() => ServerCodeCreated(
                              serverCode: serverCode,
                              // serverName:
                              //     await DBFunctions.getServerNameFromServerCode(
                              //         serverCode),
                            ));
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
