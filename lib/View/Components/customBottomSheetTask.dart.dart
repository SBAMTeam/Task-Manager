import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Models/task_model.dart';
import 'package:taskmanager/View/Pages/edit_task.dart';

import 'constants.dart';

showCustomBottomSheet(
    String taskName,
    String taskDetails,
    DateTime taskStartDate,
    DateTime taskDeadline,
    int taskId,
    int serverId,
    int taskCreatorId) {
  return showModalBottomSheet(
      context: Get.context,
      builder: (context) {
        return Container(
          color: Color(buttonColorOne),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: new Icon(
                  Icons.edit,
                  color: Color(0xfff1f1f1),
                ),
                title: new Text(
                  'Edit Task',
                  style: TextStyle(color: Color(0xfff1f1f1)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Taskmodel taskmodel = Taskmodel();
                  taskmodel.taskId = taskId.toString();
                  taskmodel.taskServerId = serverId.toString();
                  taskmodel.taskName = taskName;
                  taskmodel.taskDetails = taskDetails;
                  taskmodel.taskStartDate = taskStartDate.toString();
                  taskmodel.taskDeadline = taskDeadline.toString();
                  taskmodel.taskCreatorId = taskCreatorId.toString();
                  Get.to(() => EditTask(taskmodel: taskmodel));
                },
              ),
              ListTile(
                leading: new Icon(
                  Icons.delete,
                  color: Color(0xfff1f1f1),
                ),
                title: new Text('Delete Task',
                    style: TextStyle(color: Color(0xfff1f1f1))),
                onTap: () {
                  Navigator.pop(context);
                  Taskmodel taskmodel = Taskmodel();
                  taskmodel.taskId = taskId.toString();
                  taskmodel.taskServerId = serverId.toString();
                  _deleteTask(taskmodel);
                },
              ),
            ],
          ),
        );
      });
}

_deleteTask(Taskmodel taskmodel) async {
  await taskController
      .deleteTask(taskmodel)
      .then((value) => taskController.update());
}
