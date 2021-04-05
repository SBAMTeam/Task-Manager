import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:taskmanager/Controllers/navigation_controller.dart';
import 'package:taskmanager/Controllers/user_controller.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/Models/server_model.dart';
import 'package:taskmanager/Models/user_model.dart';
import 'package:taskmanager/View/Components/CardBuilder.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/ExtraIcons.dart';
import 'package:taskmanager/View/Components/NavigationBar.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Components/text_builder.dart';
import 'package:taskmanager/Database/db_functions.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  var username;

  final UserController uc = Get.put(UserController());
  @override
  void initState() {
    uc.getUsername().then((String result) {
      setState(() {
        username = result;
        return;
      });
      return;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Usermodel usermodel = Usermodel();
    Servermodel servermodel = Servermodel();
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // SizedBox(
            //   height: sizedBoxBigSpace,
            // ),
            Container(
              height: Get.height / 2.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width / 16),
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: username,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                              children: [
                                TextSpan(
                                  text: '\nrole/job title',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 20),
                                ),
                              ]),
                        ),
                        // SizedBox(
                        //   width: sizedBoxBigSpace * 3.04,
                        // ),
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(9.0), //or 15.0
                          child: Container(
                            height: 60.0,
                            width: 60.0,
                            color: Color(buttonColorOne),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: 100,
                  // ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // SizedBox(width: sizedBoxSmallSpace),
                        CardBuilder(),
                        // SizedBox(width: sizedBoxSmallSpace),
                        CardBuilder(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              height: Get.height / 1.8,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width / 16),
                    child: Row(
                      children: [
                        TextBuilder(
                          text: 'My Tasks',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(Get.width / 16),
                    margin: EdgeInsets.symmetric(
                        horizontal: Get.width / 16),
                    // height: Get.height / 4.5,
                    // width: Get.width,
                    decoration: BoxDecoration(
                        color: Color(buttonColorTwo),
                        borderRadius: BorderRadius.circular(9),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 4,
                            offset: Offset(1, 3),
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(9.0),
                                  child: Container(
                                    height: 60.0,
                                    width: 60.0,
                                    color: Color(buttonColorOne),
                                    child: Icon(
                                      Icons.list,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                TextBuilder(
                                  text: "To Do",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ],
                            ),
                            TextBuilder(
                              text: "5 tasks",
                              fontSize: 16,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(
                                      9.0), //or 15.0
                                  child: Container(
                                    height: 60.0,
                                    width: 60.0,
                                    color: Color(0xffFF0E58),
                                    child: Icon(
                                      Icons.list,
                                      color: Colors.white,
                                      size: 60,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                TextBuilder(
                                  text: "Done",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ],
                            ),

                            // SizedBox(
                            //   width: Get.width / 3.6,
                            // ),
                            TextBuilder(
                              text: "4 tasks",
                              fontSize: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Obx(
      //   () => NavBar(),
      // ),
    );
  }
}
