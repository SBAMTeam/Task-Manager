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
import 'package:taskmanager/View/Components/TextFieldBuilder.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Components/functions.dart';
import 'package:taskmanager/View/Pages/tasks_list.dart';

GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class EditTask extends GetView<TaskController> {
  final Taskmodel taskmodel;
  EditTask({Key key, @required this.taskmodel}) : super(key: key);

  // final int serverId;
  @override
  Widget build(BuildContext context) {
    // Servermodel servermodel = Servermodel();
    // return Obx(() {
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    taskmodel.taskUserId = taskmodel.taskCreatorId;
                    _editTask(taskmodel);
                    // _selectServer(controller, servermodel, serverId, userId);
                    Get.until((route) => Get.currentRoute == '/() => NavBar');
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextFieldBuilder(
                  hint: 'Task name',
                  icon: Icons.add,
                  controller: TextEditingController(text: taskmodel.taskName),
                  // style: TextStyle(color: Colors.white),
                  maxLength: 20,
                  autoValidateMode: AutovalidateMode.onUserInteraction,

                  // de: InputDecoration(labelText: "Task Name"),
                  onSavedFunc: (value) {
                    taskmodel.taskName = value.trim();
                    print("Task name : ${taskmodel.taskName}");
                  },
                  validatorFunction: (String value) {
                    if (value.isEmpty) {
                      return "Task name field is empty";
                    }
                  },
                ),
                TextFieldBuilder(
                  hint: 'Task Details',
                  icon: Icons.details,
                  controller:
                      TextEditingController(text: taskmodel.taskDetails),

                  // decoration: InputDecoration(labelText: "Task Details"),
                  maxLength: 600,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  inputFormatter: [
                    LengthLimitingTextInputFormatter(600),
                  ],
                  textInputType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 10,
                  onSavedFunc: (value) {
                    taskmodel.taskDetails = value.trim();
                    print("Task details : ${taskmodel.taskDetails}");
                  },
                  validatorFunction: (String value) {
                    if (value.trim().isEmpty) {
                      return "Task details field is empty";
                    }
                  },
                ),
                DateTimePicker(
                  controller:
                      TextEditingController(text: taskmodel.taskStartDate),
                  decoration: InputDecoration(
                    errorMaxLines: 3,
                    // helperText: '',

                    contentPadding: EdgeInsets.symmetric(vertical: 1.0),
                    prefixIcon: Icon(
                      Icons.date_range,
                      size: 35,
                      color: Color(iconColor),
                    ),
                    filled: true,
                    fillColor: Color(textFieldColor),
                    hintText: 'Start Date',
                    hintStyle: TextStyle(
                      color: Color(textColor),
                      fontSize: 18,
                      height: 0.9,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    focusColor: Color(textFieldColor),
                  ),
                  type: DateTimePickerType.dateTime,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                  onSaved: (value) {
                    taskmodel.taskStartDate = value.trim();
                    print("Task will start on : ${taskmodel.taskStartDate}");
                  },
                  validator: (String value) {
                    if (value.trim().isEmpty) {
                      return "Task Start Date field is empty";
                    }
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                DateTimePicker(
                  controller:
                      TextEditingController(text: taskmodel.taskDeadline),
                  decoration: InputDecoration(
                    errorMaxLines: 3,
                    // helperText: '',
                    contentPadding: EdgeInsets.symmetric(vertical: 1.0),
                    prefixIcon: Icon(
                      Icons.timer,
                      size: 35,
                      color: Color(iconColor),
                    ),
                    filled: true,
                    fillColor: Color(textFieldColor),
                    hintText: 'Deadline',
                    hintStyle: TextStyle(
                      color: Color(textColor),
                      fontSize: 18,
                      height: 0.9,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    focusColor: Color(textFieldColor),
                  ),
                  type: DateTimePickerType.dateTime,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2030),
                  onSaved: (value) {
                    taskmodel.taskDeadline = value.trim();
                    print("Task will end on : ${taskmodel.taskDeadline}");
                  },
                  validator: (String value) {
                    if (value.trim().isEmpty) {
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
  }
}

_editTask(Taskmodel taskmodel) async {
  // taskmodel.taskServerId = serverId.toString();
  // taskmodel.taskCreatorId = userId.toString();
  await taskController
      .editTask(taskmodel)
      .then((value) => taskController.update());
}
