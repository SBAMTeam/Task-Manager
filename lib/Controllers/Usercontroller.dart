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
    var a = usermodel.toJson();
    final response =
        await http.post(Uri.parse(registerUrl), body: jsonEncode(a));
    // var data = jsonDecode(response.body);
    print("I eat ass");
    print(response.body);
  }
}
