import 'package:get/get.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/Models/user_model.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert';

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

  static Future register(Usermodel usermodel) async {
    final response = await http.post(Uri.parse(registerUrl),
        body: jsonEncode(usermodel.toJson()));
    print("Im response body ${response.body}\n");
    return response.statusCode;
  }

  Future<int> login(Usermodel usermodel) async {
    final response = await http.post(Uri.parse(loginUrl),
        body: jsonEncode(usermodel.toJson()));
    if (response.statusCode == 200) {
      try {
        loggedIn(false);
      } catch (e) {
        print("exception $e in user controller");
      } finally {
        Usermodel u = usermodelFromJson(response.body);
        await DBFunctions.insertUserAndServer(u);
      }
    }
    return response.statusCode;
  }

  Future<String> getUsername() async {
    return await DBFunctions.getUsername();
  }
}
