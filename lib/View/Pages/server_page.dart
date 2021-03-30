import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:taskmanager/Controllers/navigation_controller.dart';
import 'package:taskmanager/Models/server_model.dart';
import 'package:taskmanager/Models/user_model.dart';
import 'package:taskmanager/View/Components/CardBuilder.dart';
import 'package:taskmanager/View/Components/Constants.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/ExtraIcons.dart';
import 'package:taskmanager/View/Components/NavigationBar.dart';
import 'package:taskmanager/View/Components/text_builder.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Usermodel usermodel = Usermodel();
    Servermodel servermodel = Servermodel();
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: sizedBoxBigSpace,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Get.width / 16),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                          text: 'Fname Lname',
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
                    SizedBox(
                      width: sizedBoxBigSpace * 3.04,
                    ),
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
              SizedBox(height: sizedBoxBigSpace * 1.5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: sizedBoxSmallSpace),
                    CardBuilder(),
                    SizedBox(width: sizedBoxSmallSpace),
                    CardBuilder(),
                  ],
                ),
              ),
              SizedBox(height: sizedBoxBigSpace * 2),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: Get.width / 16),
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
                margin:
                    EdgeInsets.symmetric(horizontal: Get.width / 16),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(9.0),
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
                          width: Get.width / 30,
                        ),
                        TextBuilder(
                          text: "To Do",
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        SizedBox(
                          width: sizedBoxBigSpace * 3.3,
                        ),
                        TextBuilder(
                          text: "5 tasks",
                          fontSize: 16,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height / 60,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius:
                              BorderRadius.circular(9.0), //or 15.0
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
                          width: Get.width / 30,
                        ),
                        TextBuilder(
                          text: "Done",
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                        SizedBox(
                          width: Get.width / 3.6,
                        ),
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
      ),
      // bottomNavigationBar: Obx(
      //   () => NavBar(),
      // ),
    );
  }
}
