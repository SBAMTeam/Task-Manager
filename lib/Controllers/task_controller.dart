import 'dart:convert';
import 'dart:convert' as convert;

import 'package:get/get.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/Database/database.dart';
import 'package:taskmanager/Models/task_model.dart';
import 'package:http/http.dart' as http;
import 'package:taskmanager/View/Components/constants.dart';

class TaskController extends GetxController {
  var isLoading = false.obs;
  // var serverId = 0.obs;
  var taskList = List<Task>.empty(growable: true).obs;
  // var realTaskList = List<Task>.empty(growable: true).obs;

  @override
  void onInit() {
    print("IM TASK CONTROLLER BEING INITIALISED RN");
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

  Future createTask(Taskmodel taskmodel) async {
    final response = await http.post(Uri.parse(createTaskUrl),
        body: jsonEncode(taskmodel.toJson()));
    print("this is sent on creation : \n${taskmodel.toJson()}");
    print(response.body);
    print(response.statusCode);
    return response.statusCode;
  }

  Future getUserTasksFromDB() async {
    try {
      isLoading(true);
      var tasks = (await DBFunctions.getUserTasks()).toList();
      print("all tasks list length is : ${tasks.length} //task controller");

      if (tasks != null || tasks != []) {
        taskList.assignAll(tasks);
      }
    } catch (e) {
      print("exception $e in task controller");
    } finally {
      Future.delayed(
        Duration(seconds: 1),
        () {
          isLoading(false);
        },
      );
    }
  }
}
