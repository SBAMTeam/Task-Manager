import 'dart:convert';
import 'dart:ui';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/server_controller.dart';
import 'package:taskmanager/Controllers/task_controller.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/Models/server_model.dart';
import 'package:taskmanager/Models/task_model.dart';
import 'package:taskmanager/View/Components/functions.dart';
import 'package:taskmanager/View/Pages/tasks_list.dart';

class CreateTask extends GetView<ServerController> {
  CreateTask({Key key, @required this.serverId}) : super(key: key);
  final serverId;
  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    Servermodel servermodel = Servermodel();
    Taskmodel taskmodel = Taskmodel();
    // return Obx(() {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextButton(
                  onPressed: () async {
                    if (await checkInternetConnection() == false) {
                      return;
                    }
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                    int userId = await DBFunctions.getUserIdInteger();
                    _createTask(taskmodel, serverId, userId);
                    _selectServer(controller, servermodel, serverId, userId);
                    Get.off(() => TasksList());
                  },
                  child: Text("Submit"),
                ),
                TextFormField(
                  maxLength: 20,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(20),
                  ],
                  decoration: InputDecoration(labelText: "Task Name"),
                  onSaved: (value) {
                    taskmodel.taskName = value;
                    print("Task name : ${taskmodel.taskName}");
                  },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Task name field is empty";
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Task Details"),
                  maxLength: 600,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(600),
                  ],
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 10,
                  onSaved: (value) {
                    taskmodel.taskDetails = value;
                    print("Task details : ${taskmodel.taskDetails}");
                  },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Task details field is empty";
                    }
                  },
                ),
                DateTimePicker(
                  autovalidate: true,
                  decoration: InputDecoration(labelText: "Task Start Date"),
                  type: DateTimePickerType.dateTime,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                  onSaved: (value) {
                    taskmodel.taskStartDate = value;
                    print("Task will start on : ${taskmodel.taskStartDate}");
                  },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Task Start Date field is empty";
                    }
                  },
                ),
                DateTimePicker(
                  autovalidate: true,
                  decoration: InputDecoration(labelText: "Task Deadline"),
                  type: DateTimePickerType.dateTime,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                  onSaved: (value) {
                    taskmodel.taskDeadline = value;
                    print("Task will end on : ${taskmodel.taskDeadline}");
                  },
                  validator: (String value) {
                    if (value.isEmpty) {
                      return "Task Deadline field is empty";
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      // );
    );
  }
}

_selectServer(ServerController controller, Servermodel servermodel,
    int serverId, int userId) async {
  var serverUserTasks = await controller.selectServer(serverId, userId);
  if (!(serverUserTasks is int)) {
    try {
      servermodel = servermodelFromJson(serverUserTasks);
      servermodel.serverId = serverId.toString();
      await DBFunctions.insertTasks(
          servermodel.userTasks, int.parse(servermodel.serverId));
      controller.isLoading(true);
      controller.update();
    } catch (e) {
      print("error is : $e");
    }
    return;
  } else {
    showSnackBar("Error fetching Tasks \nResponse code is : $serverUserTasks");
  }
}

_createTask(Taskmodel taskmodel, serverId, userId) {
  taskmodel.taskServerId = serverId.toString();
  taskmodel.taskCreatorId = userId.toString();
  TaskController.createTask(taskmodel);
}
