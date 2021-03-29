import 'dart:convert';
import 'dart:convert' as convert;

import 'package:get/get.dart';
import 'package:taskmanager/Models/_taskmodel.dart';
import 'package:http/http.dart' as http;
import 'package:taskmanager/View/Components/Constants.dart';

class TaskController extends GetxController {
  static TaskController _serverController;
  static TaskController getInstance() {
    if (_serverController == null)
      return _serverController = TaskController();
    else
      return _serverController;
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
}
