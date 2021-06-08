import 'dart:convert';

import 'package:get/get.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/Database/database.dart';
import 'package:taskmanager/Models/fetch_tasks.dart';
import 'package:taskmanager/Models/server_model.dart';
import 'package:taskmanager/Models/task_model.dart';
import 'package:http/http.dart' as http;
import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Components/functions.dart';

class TaskController extends GetxController {
  var isLoading = true.obs;
  var serverTasksList = List<Task>.empty(growable: true).obs;
  var serverTasksDoneList = List<Task>.empty(growable: true).obs;

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
    print(
        "Creating task.. Sent:\n ${taskmodel.toJson()} \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");

    fetchUserServerTasks(int.parse(taskmodel.taskServerId));
    return response.statusCode;
  }

  Future editTask(Taskmodel taskmodel) async {
    final response = await http.post(Uri.parse(editTaskUrl),
        body: jsonEncode(taskmodel.toJson()));
    print(
        "Editing task.. Sent:\n ${taskmodel.toJson()} \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");

    fetchUserServerTasks(int.parse(taskmodel.taskServerId));
    return response.statusCode;
  }

  Future deleteTask(Taskmodel taskmodel) async {
    final response = await http.post(Uri.parse(deleteTaskUrl),
        body: jsonEncode(taskmodel.toJson()));
    print(
        "Deleting task.. Sent:\n ${taskmodel.toJson()} \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");
    if (response.statusCode == 200) {
      isLoading(true);
      if (serverTasksList.length > 0)
        serverTasksList.removeRange(0, serverTasksList.length);
      DBFunctions.deleteTaskById(int.parse(taskmodel.taskId));
      // fetchUserServerTasks(int.parse(taskmodel.taskServerId));
      print(serverTasksList.length);
      await fetchUserServerTasks(int.parse(taskmodel.taskServerId));
    }
    return response.statusCode;
  }

  Future fetchUserServerTasks(int serverId) async {
    if (await checkInternetConnection()) {
      isLoading(true);

      if (serverId == null || serverId < 0) return;
      FetchTasksModelTemporary a = FetchTasksModelTemporary();
      a.serverId = serverId.toString();
      a.userId = (await DBFunctions.getUserIdInteger()).toString();
      // serverController.getServerNameById(serverId);

      final response = await http.post(Uri.parse(fetchTasksUrl),
          body: jsonEncode(a.toJson()));

      print(
          "Fetching user tasks for server id $serverId.. Sent:\n ${a.toJson()} \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");

      if (response.statusCode == 200) {
        serverTasksList.clear();
        Servermodel servermodel = Servermodel();
        servermodel = servermodelFromJson(response.body);
        servermodel.serverId = serverId.toString();
        try {
          // isLoading(true);
          // DBFunctions.deleteTable();
          await DBFunctions.insertTasks(servermodel.serverTasks, serverId);
          // isLoading(true);
          await getServerTasksFromDB(serverId);
        } catch (e) {
          print("exception in fetchUserServerTasks insertTasks $e");
        }
      } else {
        getServerTasksFromDB(serverId);
      }
      // isLoading(false);

      return response.statusCode;
    }

    await getServerTasksFromDB(serverId);
    return 400;
  }

  Future getServerTasksFromDB(int serverId) async {
    try {
      isLoading(true);
      var tasks = (await DBFunctions.getServerTasks(serverId)).toList();
      // print("server tasks list length is : ${tasks.length} //task controller");

      if (tasks != null || tasks != []) {
        serverTasksList.assignAll(tasks);
      }
    } catch (e) {
      print("exception $e in task controller");
    } finally {
      Future.delayed(
        Duration(milliseconds: 500),
        () {
          isLoading(false);
        },
      );
    }
  }
}
