import 'package:get/get.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/Models/user_model.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert';

class UserController extends GetxController {
  var isLoading = true.obs;

  static Future register(Usermodel usermodel) async {
    final response = await http.post(Uri.parse(registerUrl),
        body: jsonEncode(usermodel.toJson()));
    print("Im response body ${response.body}\n");
    return response.statusCode;
  }

  static Future login(Usermodel usermodel) async {
    final response = await http.post(Uri.parse(loginUrl),
        body: jsonEncode(usermodel.toJson()));
    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    } else {
      print("im error response body : \n");
      print(response.body);
      return response.statusCode;
    }
  }

  Future<String> getUsername() async {
    return await DBFunctions.getUsername();
  }
}
