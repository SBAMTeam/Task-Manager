import 'package:get/get.dart';
import 'package:taskmanager/Models/Usermodel.dart';
import 'package:taskmanager/View/Components/Constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert';

class UserController extends GetxController {
  Rx<Usermodel> usermodel = Usermodel().obs;

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
    if (response.statusCode == 200) {
      print(response.body);
    } else
      return response.statusCode;
  }
}
