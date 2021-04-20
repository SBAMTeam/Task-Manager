import 'package:get/get.dart';
import 'package:taskmanager/Database/db_functions.dart';
import 'package:taskmanager/Database/database.dart';
import 'package:taskmanager/Models/server_model.dart';
import 'package:taskmanager/Models/user_model.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:http/http.dart' as http;
import 'package:taskmanager/View/Components/functions.dart';
import 'dart:convert' as convert;
import 'dart:convert';

class ServerController extends GetxController {
  var isLoading = true.obs;
  var serverList = List<Server>.empty(growable: true).obs;
  var servermodel = Servermodel().obs;
  var serverMembers = List<Usermodel>.empty(growable: true).obs;
  var currentServer = 0.obs;
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
    if (!await checkInternetConnection()) {
      return -1;
    } else {
      final response = await http.post(Uri.parse(createServerUrl),
          body: jsonEncode(servermodel.toJson()));
      print(
          "Creating server.. Sent:\n ${servermodel.toJson()} \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");
      if (response.statusCode != 200) {
        showSnackBar("Error creating server: ${response.statusCode}");
      }
      return response.statusCode;
    }
  }

  Future joinServer(Servermodel servermodel, Usermodel usermodel) async {
    if (!await checkInternetConnection()) {
      return -1;
    }
    Map map = usermodel.toJson();
    map.addAll(servermodel.toJson());
    // print(map);
    final response =
        await http.post(Uri.parse(joinServerUrl), body: jsonEncode(map));
    print(
        "Joining server.. Sent:\n $map \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");
    if (response.statusCode != 200) {
      showSnackBar("Error joining server: ${response.statusCode}");
    }
    // getServerNameById(int.parse(servermodel.serverId));
    return response.statusCode;
  }

  Future fetchServers() async {
    if (await checkInternetConnection()) {
      var id = await DBFunctions.getUserIdInteger();
      //////////////////////////////////////////////////////////////////////////////////
      if (id == null) {
        print(" can't fetch servers. User id is NULL");
        return;
      }
      //////////////////////////////////////////////////////////////////////////////////
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
      } else {
        if (response.statusCode != 200) {
          showSnackBar("Error fetching servers: ${response.statusCode}");
        }
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

  Future getServerMembers(int serverId) async {
    // serverMembers.removeRange(0, serverMembers.length);

    if (await checkInternetConnection()) {
      Servermodel servermodel = Servermodel();
      servermodel.serverId = serverId.toString();
      final response = await http.post(Uri.parse(fetchServerMembersUrl),
          body: jsonEncode(servermodel.toJson()));
      print(
          "Fetching server members.. Sent:\n ${servermodel.toJson()} \n recieved data is.. \n ${response.body} \n with statusCode ${response.statusCode} \n");

      if (response.statusCode != 200) {
        showSnackBar("Error fetching server members: ${response.statusCode}");
        return response.statusCode;
      }
      servermodel = servermodelFromJson(response.body);
      serverMembers.clear();
      serverMembers(servermodel.serverMembers);
      print(servermodel.toJson());
      return response.statusCode;
    } else
      return -1;
  }
}
