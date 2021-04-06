import 'dart:async';

import 'package:get/get.dart';
import 'package:moor/ffi.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/Models/user_model.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert';

import 'package:taskmanager/View/Components/functions.dart';
import 'package:taskmanager/View/Pages/logged_in_page.dart';
import 'package:taskmanager/View/Pages/login.dart';

class UserController extends GetxController {
  var loggedIn = false.obs;

  @override
  void onInit() {
    userLoggedIn();
    super.onInit();
  }

  userLoggedIn() async {
    loggedIn(await DBFunctions.isUserLoggedIn());
  }

  Future register(Usermodel usermodel) async {
    final response = await http.post(Uri.parse(registerUrl),
        body: jsonEncode(usermodel.toJson()));
    print("Im response body ${response.body}\n");
    return response.statusCode;
  }

  Future<int> login(Usermodel usermodel) async {
    final response = await http.post(Uri.parse(loginUrl),
        body: jsonEncode(usermodel.toJson()));
    print(usermodel.toJson());
    if (response.statusCode == 200) {
      loggedIn(false);

      try {
        Usermodel u = usermodelFromJson(response.body);
        await DBFunctions.insertUserAndServer(u);
      } on SqliteException catch (e) {
        print("error sqlite exception is $e");
      }
    } else {
      print(response.body);
      showSnackBar("User doesn't exist");
      Get.offAll(() => Login());
    }
    return response.statusCode;
  }

  Future<String> getUsername() async {
    return await DBFunctions.getUsername();
  }
}
