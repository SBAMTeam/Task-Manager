import 'dart:async';

import 'package:get/get.dart';
import 'package:moor/ffi.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/Models/user_model.dart';
import 'package:taskmanager/View/Components/NavigationBar.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert';

import 'package:taskmanager/View/Components/functions.dart';
import 'package:taskmanager/View/Pages/login.dart';
import 'package:taskmanager/View/Pages/server_list_ui.dart';

class UserController extends GetxController {
  var loggedIn = false.obs;
  var username = "USERNAME".obs;
  var email = "EMAIL".obs;
  var nickname = "NICKNAME".obs;
  var userLastServer = (-1).obs;
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
    print(
        "Registering.. Sent:\n ${usermodel.toJson()} \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");
    return response.statusCode;
  }

  Future<int> login(Usermodel usermodel) async {
    final response = await http.post(Uri.parse(loginUrl),
        body: jsonEncode(usermodel.toJson()));
    print(
        "Logging in.. Sent:\n ${usermodel.toJson()} \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");
    Get.offAll(() => ServersListUI(
          firstEntry: true,
        ));
    if (response.statusCode == 200) {
      loggedIn(false);
      serverController.currentServer.value = userLastServer.value;

      try {
        Usermodel u = usermodelFromJson(response.body);
        await DBFunctions.insertUserAndServer(u);
      } on SqliteException catch (e) {
        print("error sqlite exception is $e");
      }
      userController.getUsername();
      userController.getNickname(); //get needed userinfo for next screen
      taskController.fetchUserServerTasks(userController.userLastServer.value);
    } else {
      showSnackBar("User doesn't exist. Check username and password");
      Get.offAll(() => Login());
    }
    return response.statusCode;
  }

  Future getUsername() async {
    var tmp = await DBFunctions.getUsername();
    // print(tmp);

    username(tmp);
  }

  Future getEmail() async {
    email(await DBFunctions.getUserEmail());
  }

  Future getNickname() async {
    var tmp = await DBFunctions.getUserNickname();
    // print(tmp);
    nickname(tmp);
  }

  Future getUserLastServer() async {
    var tmp = await DBFunctions.getUserLastServer();
    if (tmp != null && tmp > -1) userLastServer(tmp);
  }
}
