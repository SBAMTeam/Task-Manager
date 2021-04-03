import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/server_controller.dart';
import 'package:taskmanager/Controllers/task_controller.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/Models/server_model.dart';

import 'package:taskmanager/View/Components/functions.dart';
import 'package:taskmanager/View/Components/text_builder.dart';

import 'package:taskmanager/View/Pages/tasks_list.dart';

class ServerUI extends GetView<ServerController> {
  const ServerUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var servermodel = Servermodel();
    return Obx(() {
      if (controller.isLoading.value == true) {
        return Center(child: CircularProgressIndicator());
      } else if (controller.serverList.length == 0) {
        return Center(
          child: TextBuilder(
            text: "No servers! try creating or joining one.",
            color: Colors.black,
            fontSize: 22,
          ),
        );
      }

      return ListView.builder(
          itemCount: controller.serverList.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.only(top: 4),
              child: TextButton(
                onPressed: () async {
                  int serverId, userId;
                  serverId = (controller.serverList[index].serverId);
                  userId = (await DBFunctions.getUserIdInteger());

                  ////////////////////////////////////////////////////
                  var serverUserTasks =
                      await controller.selectServer(serverId, userId);
                  if (!(serverUserTasks is int)) {
                    try {
                      servermodel = servermodelFromJson(serverUserTasks);
                      servermodel.serverId = serverId.toString();
                      await DBFunctions.insertTasks(servermodel.userTasks,
                          int.parse(servermodel.serverId));
                    } catch (e) {
                      print("error is : $e");
                    }
                    var tc = Get.find<TaskController>();
                    Get.to(() => TasksList(serverId: serverId))
                        .then((value) => tc.update());
                    return;
                  } else {
                    showSnackBar("No tasks");
                  }
                  // Get.to(() => TasksList(serverId: serverId));
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage:
                                NetworkImage("http://via.placeholder.com/360"),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.serverList[index].serverName,
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Container(
                        height: 1,
                        color: Colors.grey.withAlpha(128),
                      ),
                    ]),
              ),
            );
          });
    });
  }
}
