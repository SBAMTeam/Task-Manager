import 'package:get/get.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/Database/database.dart';
import 'package:taskmanager/Models/server_model.dart';
import 'package:taskmanager/Models/task_model.dart';
import 'package:taskmanager/Models/user_model.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:http/http.dart' as http;
import 'package:taskmanager/View/Components/functions.dart';
import 'dart:convert' as convert;
import 'dart:convert';
import 'task_controller.dart';

class ServerController extends GetxController {
  var isLoading = false.obs;
  var serverList = List<Server>.empty(growable: true).obs;
  var servermodel = Servermodel().obs;
  // var serverName = "SERVER_NAME".obs;

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

  // Future getServerNameById(int serverId) async {
  //   serverName(await DBFunctions.getServerNameById(serverId));
  // }

  Future createServer(Servermodel servermodel) async {
    final response = await http.post(Uri.parse(createServerUrl),
        body: jsonEncode(servermodel.toJson()));
    print(
        "Creating server.. Sent:\n ${servermodel.toJson()} \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");

    return response.statusCode;
  }

  Future joinServer(Servermodel servermodel, Usermodel usermodel) async {
    Map map = usermodel.toJson();
    map.addAll(servermodel.toJson());
    // print(map);
    final response =
        await http.post(Uri.parse(joinServerUrl), body: jsonEncode(map));
    print(
        "Joining server.. Sent:\n $map \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");
    // getServerNameById(int.parse(servermodel.serverId));
    return response.statusCode;
  }

  Future fetchServers() async {
    if (await checkInternetConnection()) {
      var id = await DBFunctions.getUserIdInteger();
      var usermodel = Usermodel();
      usermodel.userId = id.toString();
      final response = await http.post(Uri.parse(fetchUserServersUrl),
          body: jsonEncode(usermodel.toJson()));
      print(
          "Fetching servers.. Sent:\n ${usermodel.toJson()} \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");

      if (response.statusCode == 200) {
        usermodel = usermodelFromJson(response.body);
        usermodel.userId = id.toString();
        await DBFunctions.insertServers(usermodel);
        await getUserServersFromDB();
      }
      return response.statusCode;
    }
  }

  Future getUserServersFromDB() async {
    try {
      isLoading(true);
      var servers = (await DBFunctions.getUserServers()).toList();

      if (servers != null) {
        serverList.assignAll(servers);
      }
    } catch (e) {
      print("exception $e in server controller");
    } finally {
      Future.delayed(
        Duration(milliseconds: 500),
        () {
          isLoading(false);
        },
      );
    }
  }
}
