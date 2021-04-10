import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:taskmanager/Controllers/user_controller.dart';

import 'package:taskmanager/View/Components/CardBuilder.dart';
import 'package:get/get.dart';

import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Components/text_builder.dart';
import 'package:taskmanager/View/Components/user_info_bar.dart';

class HomePage extends GetView<UserController> {
  const HomePage(this.serverId, {Key key}) : super(key: key);
  final int serverId;
  @override
  Widget build(BuildContext context) {
    var height = Get.height;
    Usermodel usermodel = Usermodel();

    Servermodel servermodel = Servermodel();
    controller.getUsername();
    controller.getNickname();
    taskController.fetchUserServerTasks(serverId);
    int count = Get.height ~/ 120;

    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: height / 2.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  UserInfoBar(),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ListView.builder(
                        itemCount: count,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var details = (taskController
                              .serverTasksList[index].taskDetails);
                          var detailsShort = (taskController
                                  .serverTasksList[index].taskDetails)
                              .substring(0,
                                  details.length - (6 - details.length).abs());
                          DateTime deadlineDate = (taskController
                              .serverTasksList[index].taskDeadline);
                          DateTime startDate = (taskController
                              .serverTasksList[index].taskStartDate);
                          final f = new DateFormat('yyyy-MM-dd hh:mm');
                          f.format(deadlineDate);
                          f.format(startDate);
                          return CardBuilder(
                            taskTitle:
                                "Task title: ${taskController.serverTasksList[index].taskName}",
                            taskDetails: "Task Details: $detailsShort",
                            taskDeadline: "Task Deadline: $deadlineDate",
                            taskStartDate: "Task Start Date: $startDate",
                          );
                        }),
                    // child: Row(
                    //   children: [
                    //     // SizedBox(width: sizedBoxSmallSpace),
                    //     CardBuilder(),
                    //     // SizedBox(width: sizedBoxSmallSpace),
                    //     CardBuilder(),
                    //   ],
                    // ),
                  ),
                ],
              ),
            ),
            Container(
              height: height / 2,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
