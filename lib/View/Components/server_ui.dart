import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/server_controller.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/Models/Servermodel.dart';
import 'package:taskmanager/Models/Usermodel.dart';
import 'package:taskmanager/Models/_taskmodel.dart';
import 'package:taskmanager/View/Pages/createtask.dart';
import 'package:taskmanager/View/Pages/server_page.dart.old';
import 'package:taskmanager/View/Pages/tasks_list.dart';

class ServerUI extends StatefulWidget {
  ServerUI({Key key}) : super(key: key);

  @override
  _ServerUIState createState() => _ServerUIState();
}

class _ServerUIState extends State<ServerUI> {
  final ServerController sc = Get.put(ServerController());
  var servermodel = Servermodel();
  var usermodel = Usermodel();
  var taskmodel = Taskmodel();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (sc.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
              itemCount: sc.serverList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(top: 4),
                  child: TextButton(
                    onPressed: () async {
                      servermodel.serverId =
                          (sc.serverList[index].serverId).toString();
                      usermodel.userId =
                          (await DBFunctions.getUserIdInteger()).toString();
                      print("server id is : ${servermodel.serverId}");
                      print("user id is : ${usermodel.userId}");

                      String serverUserTasks =
                          await ServerController.selectServer(
                              servermodel, usermodel);

                      taskmodel = taskmodelFromJson(serverUserTasks);
                      DBFunctions.insertTask(
                          taskmodel, int.parse(servermodel.serverId));
                      Get.to(() => TasksList(
                            serverId: int.parse(servermodel.serverId),
                          ));
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
                                backgroundImage: NetworkImage(
                                  "https://via.placeholder.com/360"
                                      //uniController.uniList[index].image, //uncomment when backend has a working link
                                      ??
                                      AssetImage(
                                          'assets/images/damascus_logo.jpg'),
                                ),
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
                                      sc.serverList[index].serverName,
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
        }
      },
    );
  }
}
