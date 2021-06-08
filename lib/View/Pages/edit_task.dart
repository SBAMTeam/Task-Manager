import 'dart:ui';

import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/task_controller.dart';
import 'package:taskmanager/Models/task_model.dart';
import 'package:taskmanager/View/Components/textfield_builder.dart';
import 'package:taskmanager/View/Components/button_builder.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Components/customBottomSheetTask.dart.dart';
import 'package:taskmanager/View/Components/functions.dart';

class EditTask extends StatefulWidget {
  EditTask({Key key, @required this.taskmodel}) : super(key: key);
  final controller = Get.find<TaskController>();
  final Taskmodel taskmodel;
  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {
  GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool startDateChanged = false, deadlineChanged = false;
    // Servermodel servermodel = Servermodel();
    var assigned = true.obs;
    RxString assignedTo = "".obs;
    RxInt assignedToUserId = (-1).obs;
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
                    // int creatorId = await DBFunctions.getUserIdInteger();
                    widget.taskmodel.taskUserId =
                        widget.taskmodel.taskCreatorId;
                    print(widget.taskmodel.toJson());
                    _editTask(widget.taskmodel);
                    // _selectServer(controller, servermodel, serverId, userId);
                    // Get.until((route) => Get.currentRoute == '/() => NavBar');
                    Get.back();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                TextFieldBuilder(
                  controller:
                      TextEditingController(text: widget.taskmodel.taskName),
                  hint: 'Task name',
                  autoFocus: true,
                  icon: Icons.add,
                  maxLength: 20,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  onSavedFunc: (value) {
                    widget.taskmodel.taskName = value.trim();
                    // print("Task name : ${taskmodel.taskName}");
                  },
                  validatorFunction: (String value) {
                    if (value.isEmpty) {
                      return "Task name field is empty";
                    }
                  },
                ),
                TextFieldBuilder(
                  controller: TextEditingController(
                      text: widget.taskmodel.taskDetails.trim()),
                  hint: 'Task Details',
                  icon: Icons.details,
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
                    widget.taskmodel.taskDetails = value.trim();
                    // print("Task details : ${taskmodel.taskDetails}");
                  },
                  // validatorFunction: (String value) {
                  //   if (value.trim().isEmpty) {
                  //     return "Task details field is empty";
                  //   }
                  // },
                ),
                DateTimePicker(
                  onChanged: (v) {
                    startDateChanged = true;
                  },
                  maxLength: 50,
                  // controller:
                  //     TextEditingController(text: DateTime.now().toString()),
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
                    if (startDateChanged)
                      widget.taskmodel.taskStartDate = value;
                    // print("Task will start on : ${taskmodel.taskStartDate}");
                  },
                  // validator: (String value) {
                  //   if (value.trim().isEmpty) {
                  //     return "Task Start Date field is empty";
                  //   }
                  // },
                ),
                DateTimePicker(
                  onChanged: (v) {
                    deadlineChanged = true;
                  },
                  maxLength: 50,
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
                    if (deadlineChanged) widget.taskmodel.taskDeadline = value;
                    // print("Task will end on : ${taskmodel.taskDeadline}");
                  },
                  // validator: (String value) {
                  //   if (value.trim().isEmpty) {
                  //     return "Task Deadline field is empty";
                  //   }
                  // },
                ),
                Obx(
                  () {
                    if (serverController.serverMembers.length > 0)
                      return ButtonBuilder(
                        text: assignedTo.value == null
                            ? "Assign task to.."
                            : "Assign task to ${assignedTo.value}",
                        onPress: () async {
                          showServerMembersInBottomSheet(
                              assigned, assignedTo, assignedToUserId);
                        },
                      );
                    else
                      return SizedBox(
                        height: 0,
                      );
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
  print(taskmodel.toJson());
  await taskController
      .editTask(taskmodel)
      .then((value) => taskController.update());
}
