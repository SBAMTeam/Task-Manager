import 'package:get/get.dart';
import 'package:taskmanager/Models/Usermodel.dart';
import 'package:taskmanager/View/Components/Constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert';

class UserController extends GetxController {
  static UserController _userController;
  static UserController getInstance() {
    if (_userController == null)
      return _userController = UserController();
    else
      return _userController;
  }

  Usermodel usermodel = Usermodel();

  static Future register(Usermodel usermodel) async {
    final response = await http.post(Uri.parse(registerUrl),
        body: jsonEncode(usermodel.toJson()));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return null;
    }
  }

  static Future login(Usermodel usermodel) async {
    final response = await http.post(Uri.parse(loginUrl),
        body: jsonEncode(usermodel.toJson()));
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);
      return null;
    } else {
      return 0;
    }
  }
}
