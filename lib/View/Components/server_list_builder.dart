import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taskmanager/Controllers/server_controller.dart';
import 'package:taskmanager/Controllers/task_controller.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/Models/server_model.dart';
import 'package:taskmanager/View/Components/NavigationBar.dart';

import 'package:taskmanager/View/Components/functions.dart';
import 'package:taskmanager/View/Components/text_builder.dart';

import 'package:taskmanager/View/Pages/tasks_list.dart';

import 'constants.dart';

class ServerListBuilder extends GetView<ServerController> {
  const ServerListBuilder(this.firstEntry, {Key key}) : super(key: key);
  final bool firstEntry;
  @override
  Widget build(BuildContext context) {
    controller.getUserServersFromDB();
    return Obx(
      () {
        if (controller.isLoading.value == true) {
          // if (true) {
          return serverListShimmer();
        } else if (controller.serverList.length < 1) {
          return serverListEmpty();
        } else
          return serverListFull(controller, firstEntry);
      },
    );
  }
}

Widget serverListFull(ServerController controller, firstEntry) {
  return ListView.builder(
    itemCount: controller.serverList.length ?? 0,
    scrollDirection: Axis.vertical,
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context, index) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Color(buttonColorTwo),
          borderRadius: BorderRadius.circular(9),
        ),

        // padding: EdgeInsets.symmetric(horizontal: 8),
        // margin: EdgeInsets.symmetric(vertical: 5),

        child: TextButton(
          onPressed: () async {
            // taskController.isLoading(true);
            navController.serverName(controller.serverList[index].serverName);
            navController.selectedTab = 0;

            int serverId = (controller.serverList[index].serverId);
            serverController.currentServer.value = serverId;

            await DBFunctions.insertUserLastServer(serverId);
            await taskController.fetchUserServerTasks(serverId);
            // await serverController.getServerNameById(serverId);
            userController.userLastServer.value = serverId;
            if (firstEntry == true) {
              Get.offAll(() => NavBar());
              return;
            }
            return;
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image.network("http://via.placeholder.com/360"),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Flexible(
                child: TextBuilder(
                  scale: 0.6,
                  text: (controller.serverList[index].serverName),
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget serverListShimmer() {
  int offset = 0;
  int time = 800;
  int count = Get.height ~/ 95;
  return SafeArea(
    child: ListView.builder(
      itemCount: count,
      scrollDirection: Axis.vertical,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        // offset = 5;
        time = 800 + offset;

        // print(time);
        double containerWidth = 280;
        double containerHeight = 20;

        return Container(
          // padding: EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Color(buttonColorTwo),
            borderRadius: BorderRadius.circular(9),
          ),
          margin: EdgeInsets.symmetric(vertical: 8),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.grey,
                        ),
                        height: containerHeight,
                        width: Get.width / 1.5,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}

Widget serverListEmpty() {
  return Center(
    child: TextBuilder(
      text: "No servers! try creating or joining one.",
      color: Colors.white,
      fontSize: 22,
    ),
  );
}
