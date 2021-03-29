import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taskmanager/Database/database.dart';
import 'package:taskmanager/Models/Servermodel.dart';
import 'package:taskmanager/Models/Usermodel.dart';
import 'package:moor_flutter/moor_flutter.dart' as moor;
import 'package:taskmanager/Models/_taskmodel.dart';

class DBFunctions {
  static final userDao = Provider.of<UserDao>(Get.context, listen: false);
  static final serverDao = Provider.of<ServerDao>(Get.context, listen: false);
  static final taskDao = Provider.of<TaskDao>(Get.context, listen: false);
  static insertUser(Usermodel usermodel) {
    final newUser = UsersCompanion(
      userId: moor.Value(int.parse(usermodel.userId)),
      userEmail: moor.Value(usermodel.userEmail),
      userJwt: moor.Value(usermodel.jwt),
      userName: moor.Value(usermodel.userName),
      userNickname: moor.Value(usermodel.userNickname),
      userLogMessage: moor.Value(usermodel.logMessages),
      userLoggedIn: moor.Value(true),
    );
    userDao.insertUser(newUser);
  }

  static insertServerOnCreation(Servermodel servermodel) async {
    if (servermodel != null) {
      var ownerId = await getUserIdInteger();
      final newServer = ServersCompanion(
          serverId: moor.Value(int.parse("5")),
          serverName: moor.Value(servermodel.serverName),
          serverOwnerId: moor.Value(ownerId));
      serverDao.insertServer(newServer);
    } else {
      return;
    }
  }

  static insertServersOnLogin(Usermodel usermodel) {
    if (usermodel.userServers != null) {
      if (usermodel.userServers.length > 0) {
        for (Servermodel server in usermodel.userServers) {
          final newServer = ServersCompanion(
            serverId: moor.Value(int.parse(server.serverId)),
            serverName: moor.Value(server.serverName),
            serverOwnerId: moor.Value(
              int.parse(server.serverOwnerId),
            ),
            userId: moor.Value(int.parse(usermodel.userId)),
          );
          serverDao.insertServer(newServer);
        }
      } else
        return;
    } else
      return;
  }

  static insertUserAndServer(Usermodel usermodel) {
    DBFunctions.insertUser(usermodel);
    if (usermodel.userServers != null)
      DBFunctions.insertServersOnLogin(usermodel);
  }

  static insertTask(Taskmodel taskmodel, int serverId) {
    var task = TasksCompanion(
      serverId: moor.Value(serverId),
      taskCreatorId: moor.Value(int.parse(taskmodel.taskCreatorId)),
      taskDeadline: moor.Value(DateTime.parse(taskmodel.taskDeadline)),
      taskStartDate: moor.Value(DateTime.parse(taskmodel.taskStartDate)),
      taskDetails: moor.Value(taskmodel.taskDetails),
      taskId: moor.Value(int.parse(taskmodel.taskId)),
      taskName: moor.Value(taskmodel.taskName),
      // taskProgress: //add later maybe
    );
  }

  static Future<List<dynamic>> getAllDetails() async {
    return [
      await DBFunctions.getUserDetails(),
      await DBFunctions.getUserServers()
    ];
  }

  static Future getUserIdInteger() async {
    var tmp = await userDao.getUserData();
    return tmp[0].userId;
  }

  static Future getUsername() async {
    var tmp = await userDao.getUserData();
    return tmp[0].userName;
  }

  static Future getUserEmail() async {
    var tmp = await userDao.getUserData();
    return tmp[0].userEmail;
  }

  static Future getUserNickname() async {
    var tmp = await userDao.getUserData();
    return tmp[0].userNickname;
  }

  static Future getUserJwt() async {
    var tmp = await userDao.getUserData();
    return tmp[0].userJwt;
  }

  static Future getUserLogMessage() async {
    var tmp = await userDao.getUserData();
    return tmp[0].userLogMessage;
  }

  static Future<bool> isUserLoggedIn() async {
    List<User> tmp = await userDao.getUserData();
    if (tmp.length < 1) {
      return false;
    } else {
      bool tmp1 = tmp[0].userLoggedIn;
      print(tmp1);
      return tmp1;
    }
  }

  static Future getUserDetails() async {
    var tmp = await userDao.getUserData();
    return tmp;
  }

  static Future<List<Server>> getUserServers() async {
    var tmp = await serverDao.getServers();
    print(tmp);
    return tmp;
  }

  static Future getUserTasks() async {
    List<Task> tmp = await taskDao.getTasks();
    print(tmp);
    return tmp;
  }

  // static Future getServerOwnerIdInteger(String inputServerCode) async {
  //   for (Servers server in await serverDao.getServers()) {
  //     if (server.serverCode.toString() == inputServerCode) {
  //       print(server.serverCode.toString());
  //       return server.serverOwnerId;
  //     }
  //   }
  // }

  // static Future getServerNameFromServerCode(String inputServerCode) async {
  //   for (Servers server in await serverDao.getServers()) {
  //     if (server.serverCode.toString() == inputServerCode) {
  //       print(server.serverCode.toString());
  //       return server.serverName;
  //     }
  //   }
  // }
}
