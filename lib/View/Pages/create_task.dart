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
  // final ServerController sc = Get.find();

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    Servermodel servermodel = Servermodel();
    Taskmodel taskmodel = Taskmodel();
    return Obx(() {
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
                      var userId = await DBFunctions.getUserIdInteger();
                      TaskController.createTask(userId, serverId);

                      /////////////////////////
                      var serverUserTasks =
                          await controller.selectServer(serverId, userId);
                      if (!(serverUserTasks is int)) {
                        try {
                          servermodel = servermodelFromJson(serverUserTasks);
                          servermodel.serverId = serverId.toString();
                          await DBFunctions.insertTasks(servermodel.userTasks,
                              int.parse(servermodel.serverId));
                          Get.back();
                        } catch (e) {
                          print("error is : $e");
                        }
                        return;
                      } else {
                        showSnackBar(
                            "Error Creating Task \nResponse code is : $serverUserTasks");
                        // Get.snackbar("Error Creating Task",
                        //     "Response code is : $serverUserTasks");
                      }
                    },
                    child: Text("Submit"),
                  ),
                  TextFormField(
                    maxLength: 20,
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
      );
    });
  }
}
