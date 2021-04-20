import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

import 'package:taskmanager/Controllers/task_controller.dart';
import 'package:taskmanager/View/Components/CardBuilder.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Components/customBottomSheetTask.dart.dart';
import 'package:taskmanager/View/Components/text_builder.dart';
import 'package:taskmanager/View/Components/user_info_bar.dart';
import 'package:taskmanager/View/Pages/create_task.dart';

var height = Get.height - Get.statusBarHeight;

class ServerPage extends GetView<TaskController> {
  const ServerPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(serverController.currentServer.value);
    // controller.fetchUserServerTasks(serverId);
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: Container(
          padding: defaultPadding,
          child: Column(
            children: [
              UserInfoBar(),
              SingleChildScrollView(
                child: Obx(
                  () {
                    if (controller.isLoading.value == true)
                      return serverLoadingShimmer();
                    // taskController.isLoading.value = true;
                    else
                      return serverIsLoaded();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget shimmerTodoContainer() {
  int offset = 0;
  int time = 800;
  time = 800 + offset;

  int count = 1;
  double textHeight = 20;

  return Container(
    padding: EdgeInsets.only(left: 16, top: 8, bottom: 8),
    // margin: defaultPadding,
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
      ],
    ),

    child: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color(buttonColorTwo),
            borderRadius: BorderRadius.circular(9),
          ),
          margin: EdgeInsets.only(top: 8),
          child: Shimmer.fromColors(
            highlightColor: Color(buttonColorOne),
            baseColor: Color(buttonColorTwo),
            period: Duration(milliseconds: time),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 7.5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.grey,
                    ),
                    height: 60,
                    width: 60,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey,
                    ),
                    height: textHeight,
                    width: Get.width / 1.5,
                  ),
                ],
              ),
            ),
          ),

          // ),
        ),
        Container(
          // padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Color(buttonColorTwo),
            borderRadius: BorderRadius.circular(9),
          ),
          margin: EdgeInsets.only(bottom: 8),
          child: Shimmer.fromColors(
            highlightColor: Color(buttonColorOne),
            baseColor: Color(buttonColorTwo),
            period: Duration(milliseconds: time),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 7.5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.grey,
                    ),
                    height: 60,
                    width: 60,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.grey,
                    ),
                    height: textHeight,
                    width: Get.width / 1.5,
                  ),
                ],
              ),
            ),
          ),

          // ),
        ),
      ],
    ),
  );
}

Widget serverLoadingShimmer() {
  int offset = 0;
  int time = 800;
  int count = Get.width ~/ 100;
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Container(
        padding: EdgeInsets.only(top: 16),
        width: Get.width,
        height: 20,
        child: Shimmer.fromColors(
          highlightColor: Color(buttonColorOne),
          baseColor: Color(buttonColorTwo),
          period: Duration(milliseconds: time),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 7.5),
          ),
        ),
      ),
      Container(
        height: height / 3,
        child: ListView.builder(
          semanticChildCount: 2,
          itemCount: count,
          scrollDirection: Axis.horizontal,
          // physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            // offset = 5;
            time = 800 + offset;

            return Container(
              padding: EdgeInsets.all(Get.width / 16),
              height: Get.height / 4.5,
              width: Get.width / 1.5,
              margin: EdgeInsets.only(right: 8, bottom: 8, top: 8),
              decoration: BoxDecoration(
                color: Color(buttonColorTwo),
                borderRadius: BorderRadius.circular(9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 4,
                    offset: Offset(1, 3),
                  )
                ],
              ),
              child: Container(
                child: Shimmer.fromColors(
                  highlightColor: Color(buttonColorOne),
                  baseColor: Color(buttonColorTwo),
                  period: Duration(milliseconds: time),
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 7.5, horizontal: 7.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.black,
                          ),
                          height: 25,
                          width: Get.width,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.grey,
                          ),
                          height: 25,
                          width: Get.width,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.grey,
                          ),
                          height: 25,
                          width: Get.width,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: Colors.grey,
                          ),
                          height: 25,
                          width: Get.width,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),

      shimmerTodoContainer() // Container(height: height / 3, child: Column()),
    ],
  );
}

Widget serverTasksLoaded() {
  return Container(
    height: height / 3,
    child: Obx(
      () {
        if (!taskController.isLoading.value) {
          if (taskController.serverTasksList.length > 0 &&
              !taskController.isLoading.value) {
            return ListView.builder(
              itemCount: taskController.serverTasksList.length,
              scrollDirection: Axis.horizontal,
              // physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                String details =
                    (taskController.serverTasksList[index].taskDetails) ??
                        "No details";
                var detailsShort;
                if (details.length > 50) {
                  detailsShort =
                      (taskController.serverTasksList[index].taskDetails)
                          .substring(
                              0, details.length - (25 - details.length).abs());

                  detailsShort += "...";
                }
                DateTime deadlineDate =
                    (taskController.serverTasksList[index].taskDeadline);
                DateTime startDate =
                    (taskController.serverTasksList[index].taskStartDate);
                final f = new DateFormat('yyyy-MM-dd hh:mm');

                return CardBuilder(
                  taskTitle:
                      "${taskController.serverTasksList[index].taskName}",
                  taskDetails: (details.length > 50 ? detailsShort : details),
                  taskDeadline: deadlineDate != null
                      ? f.format(deadlineDate)
                      : "No start date.",
                  taskStartDate:
                      startDate != null ? f.format(startDate) : "No deadline.",
                  onLongPress: () {
                    showTaskLongPressBottomSheet(
                      taskController.serverTasksList[index].taskName,
                      details,
                      taskController.serverTasksList[index].taskStartDate,
                      taskController.serverTasksList[index].taskDeadline,
                      taskController.serverTasksList[index].taskId,
                      taskController.serverTasksList[index].serverId,
                      taskController.serverTasksList[index].taskCreatorId,
                      taskController.serverTasksList[index].userAssignedTask,
                    );
                    // Get.to(() => TaskDetailsPage());
                    // showDialog(
                    //     context: Get.context,
                    //     builder: (context) {
                    //       return showCustomDialog();
                    //     });
                  },
                );
              },
            );
          } else {
            return Center(
              child: TextBuilder(
                textAlign: TextAlign.center,
                text: "Server doesn't have any tasks yet.\n Try creating one?",
                scale: 0.5,
              ),
            );
          }
        } else {
          return tasksShimmer();
        }
      },
    ),
  );
}

Widget serverIsLoaded() {
  // var height = Get.height - Get.statusBarHeight;
  // int count = 3;
  String serverName = navController.serverName.value ?? "My";
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(top: 16),
        child: AutoSizeText(
          '$serverName Tasks',
          textScaleFactor: 2,
          textAlign: TextAlign.left,
          maxLines: 2,
          // maxFontSize: 1,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          // ),

          // padding: EdgeInsets.symmetric(horizontal: Get.width / 16),
        ),
      ),
      Container(child: serverTasksLoaded()),
      Container(
        height: height / 2.58,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(Get.width / 16),
              // margin: defaultPadding,
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
                          AutoSizeText(
                            "To Do",
                            // minFontSize: 12,
                            textScaleFactor: 1.5,
                            maxLines: 1,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              // fontSize: 24
                            ),
                            // fontSize: 25,
                          ),
                        ],
                      ),
                      Obx(
                        () => TextBuilder(
                          text:
                              "${taskController.serverTasksList.length} tasks",
                          fontSize: 16,
                          maxLines: 1,
                        ),
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
                            width: 10,
                          ),
                          AutoSizeText(
                            "Done",
                            textScaleFactor: 1.5,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Obx(
                        () => TextBuilder(
                          text:
                              "${taskController.serverTasksDoneList.length} tasks",
                          fontSize: 16,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () async {
                          Get.to(() => CreateTask());
                          await serverController.getServerMembers(
                              serverController.currentServer.value);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.add_circle_outline_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(width: 10),
                            TextBuilder(
                              text: "Add task",
                              scale: 0.5,
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget tasksShimmer() {
  var offset = 5;
  var time = 800 + offset;

  return Container(
    child: Shimmer.fromColors(
      highlightColor: Color(buttonColorOne),
      baseColor: Color(buttonColorTwo),
      period: Duration(milliseconds: time),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 7.5, horizontal: 7.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Colors.black,
              ),
              height: 25,
              width: Get.width,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Colors.grey,
              ),
              height: 25,
              width: Get.width,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Colors.grey,
              ),
              height: 25,
              width: Get.width,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Colors.grey,
              ),
              height: 25,
              width: Get.width,
            ),
          ],
        ),
      ),
    ),
  );
}
