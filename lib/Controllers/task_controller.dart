import 'dart:convert';
import 'dart:convert' as convert;

import 'package:get/get.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/Database/database.dart';
import 'package:taskmanager/Models/_taskmodel.dart';
import 'package:http/http.dart' as http;
import 'package:taskmanager/View/Components/constants.dart';

class TaskController extends GetxController {
  var isLoading = true.obs;
  List<Task> taskList = List<Task>().obs;
  @override
  void onInit() {
    getUserTasksFromDB();
    super.onInit();
  }

  static TaskController _taskController;
  static TaskController getInstance() {
    if (_taskController == null)
      return _taskController = TaskController();
    else
      return _taskController;
  }

  var taskmodel = Taskmodel().obs;

  static Future createTask(Taskmodel taskmodel) async {
    final response = await http.post(Uri.parse(createTaskUrl),
        body: jsonEncode(taskmodel.toJson()));
    print(taskmodel.toJson());
    print(response.body);
    print(response.statusCode);
    return response.statusCode;
  }

  Future getUserTasksFromDB() async {
    try {
      isLoading(true);
      var tasks = (await DBFunctions.getUserTasks()).toList();

      if (tasks != null) {
        taskList.assignAll(tasks);
      }
    } finally {
      isLoading(false);
    }
    print(taskList[0].taskName);
  }
}
