import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:taskmanager/Models/Servermodel.dart';
import 'package:taskmanager/Models/Usermodel.dart';
import 'package:taskmanager/View/Components/CardBuilder.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/text_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Usermodel usermodel = Usermodel();
    Servermodel servermodel = Servermodel();
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // SizedBox(
            //   height: sizedBoxBigSpace,
            // ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Container(
                width: Get.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: Get.width / 1.5,
                      child: RichText(
                        text: TextSpan(
                            text: 'FIRST NAME LAST NAME',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                            children: [
                              TextSpan(
                                text: '\nROLE/JOB TITLE',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 20),
                              ),
                            ]),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(9.0), //or 15.0
                      child: Container(
                        height: Get.width / 6,
                        width: Get.width / 6,
                        color: Color(buttonColorOne),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // SizedBox(height: sizedBoxBigSpace * 1.5),
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
            // SizedBox(height: sizedBoxBigSpace * 2),
            Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: Get.width / 16),
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
                  margin: EdgeInsets.symmetric(horizontal: Get.width / 16),
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
                            width: Get.width / 3.6,
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
                            borderRadius: BorderRadius.circular(9.0), //or 15.0
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
          ],
        ),
      ),
    );
  }
}
