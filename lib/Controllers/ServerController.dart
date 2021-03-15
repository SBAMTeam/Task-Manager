import 'package:get/get.dart';
import 'package:taskmanager/Models/Servermodel.dart';
import 'package:taskmanager/Models/Usermodel.dart';
import 'package:taskmanager/View/Components/Constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert';

class ServerController extends GetxController {
  static ServerController _serverController;
  static ServerController getInstance() {
    if (_serverController == null)
      return _serverController = ServerController();
    else
      return _serverController;
  }

  var servermodel = Servermodel().obs;

  static Future createServer(Servermodel servermodel) async {
    final response = await http.post(Uri.parse(createServerUrl),
        body: jsonEncode(servermodel.toJson()));
    print(servermodel.toJson());
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return null;
    }
  }

  static Future joinServer(Servermodel servermodel, Usermodel usermodel) async {
    Map map = usermodel.toJson();
    map.addAll(servermodel.toJson());
    print(map);
    final response =
        await http.post(Uri.parse(joinServerUrl), body: jsonEncode(map));
    print(response.statusCode);
    print('IM BODY');
    print(response.body);
    if (response.statusCode == 200) {
      return null;
    }
  }

  static Future selectServer(
      Servermodel servermodel, Usermodel usermodel) async {
    Map map = usermodel.toJson();
    map.addAll(servermodel.toJson());
    print(map);
    final response =
        await http.post(Uri.parse(selectServerUrl), body: jsonEncode(map));
    print(response.statusCode);
    print('IM BODY');
    print(response.body);
    if (response.statusCode == 200) {
      return null;
    }
  }
}
