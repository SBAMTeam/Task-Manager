import 'dart:convert';
import 'dart:ui';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskmanager/Controllers/TaskController.dart';
import 'package:taskmanager/Database/_db_functions.dart';
import 'package:taskmanager/Models/_taskmodel.dart';

class ServersList extends StatelessWidget {
  const ServersList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                    var test = (await DBFunctions.getUserServers()).toList();
                    print(test[0]);
                    if (!_formKey.currentState.validate()) {
                      return;
                    }
                    _formKey.currentState.save();
                    TaskController.createTask(taskmodel);
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
  }
}
