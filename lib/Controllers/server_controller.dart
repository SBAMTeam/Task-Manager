import 'package:get/get.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/Database/database.dart';
import 'package:taskmanager/Models/server_model.dart';
import 'package:taskmanager/Models/user_model.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert';

class ServerController extends GetxController {
  var isLoading = true.obs;
  List<Server> serverList = List<Server>().obs;

  @override
  void onInit() {
    getUserServersFromDB();
    super.onInit();
  }

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
    return response.statusCode;
  }

  static Future joinServer(Servermodel servermodel, Usermodel usermodel) async {
    Map map = usermodel.toJson();
    map.addAll(servermodel.toJson());
    print(map);
    final response =
        await http.post(Uri.parse(joinServerUrl), body: jsonEncode(map));
    print("Join request sent. Status code : ${response.statusCode}");
    print('IM BODY');
    print(response.body);
    return response.statusCode;
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
    if (response.statusCode == 200)
      return response.body;
    else
      return response.statusCode;
  }

  Future getUserServersFromDB() async {
    try {
      isLoading(true);
      var servers = (await DBFunctions.getUserServers()).toList();

      if (servers != null) {
        serverList.assignAll(servers);
      }
    } finally {
      isLoading(false);
    }
    print(serverList[0].serverName);
  }
}
