import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/server_controller.dart';
import 'package:taskmanager/Controllers/task_controller.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/Database/database.dart';
import 'package:taskmanager/Models/server_model.dart';
import 'package:taskmanager/Models/user_model.dart';
import 'package:taskmanager/Models/task_model.dart';
import 'package:taskmanager/View/Pages/server_page.dart.old';

class TaskUI extends StatefulWidget {
  TaskUI({Key key, @required this.serverId}) : super(key: key);
  final int serverId;

  @override
  _TaskUIState createState() => _TaskUIState();
}

class _TaskUIState extends State<TaskUI> {
  List<Task> realTaskList;
  @override
  void initState() {
    // if (tc.taskList.length == null) {
    //   tc.taskList.length = 0;
    // }
    for (var i = 0; i < tc.taskList?.length; i++) {
      if (tc.taskList[i].serverId == widget.serverId) {
        realTaskList.add(tc.taskList[i]);
      }
    }
    super.initState();
  }

  @override
  final TaskController tc = Get.put(TaskController());
  var taskmodel = Taskmodel();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (tc.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
              itemCount: realTaskList.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.only(top: 4),
                  child: TextButton(
                    onPressed: () {
                      // var serverUserTasks = await ServerController.selectServer(
                      //     servermodel, usermodel);
                      // Get.to(() => ServerPage());
                    },
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 8,
                              ),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      realTaskList[index].taskName,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      realTaskList[index].taskDetails,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      realTaskList[index]
                                          .taskDeadline
                                          .toString(),
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
