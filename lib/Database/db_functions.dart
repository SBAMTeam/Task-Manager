import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taskmanager/Database/database.dart';
import 'package:taskmanager/Models/server_model.dart';
import 'package:taskmanager/Models/user_model.dart';
import 'package:moor/moor.dart' as moor;
import 'package:taskmanager/Models/task_model.dart';

class DBFunctions {
  static final userDao = Provider.of<UserDao>(Get.context, listen: false);
  static final serverDao = Provider.of<ServerDao>(Get.context, listen: false);
  static final taskDao = Provider.of<TaskDao>(Get.context, listen: false);
  static insertUser(Usermodel usermodel) {
    try {
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
    } catch (e) {
      print("insertUser error: $e");
    }
  }

  static insertServerOnCreation(Servermodel servermodel) async {
    try {
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
    } catch (e) {
      print("insertServerOnCreation error: $e");
    }
  }

  static insertServers(Usermodel usermodel) {
    try {
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
    } catch (e) {
      print("insertServers error: $e");
    }
  }

  static insertUserAndServer(Usermodel usermodel) {
    DBFunctions.insertUser(usermodel);
    if (usermodel.userServers != null) DBFunctions.insertServers(usermodel);
  }

  static insertTasks(List<Taskmodel> taskList, int serverId) {
    try {
      if (taskList != null) {
        if (taskList.length > 0) {
          for (Taskmodel task in taskList) {
            final newTask = TasksCompanion(
              serverId: moor.Value(serverId),
              taskId: moor.Value(int.parse(task.taskId)),
              taskCreatorId: moor.Value(int.parse(task.taskCreatorId)),
              taskDeadline: task.taskDeadline != null
                  ? moor.Value(DateTime.parse(task.taskDeadline))
                  : moor.Value.absent(),
              taskDetails: moor.Value(
                  task.taskDetails.length > 0 ? task.taskDetails : null),
              taskName: moor.Value(task.taskName),
              taskStartDate: task.taskStartDate != null
                  ? moor.Value(
                      DateTime.parse(task.taskStartDate),
                    )
                  : moor.Value.absent(),
              userAssignedTask: task.userAssignedTask != null
                  ? moor.Value(int.parse(task.userAssignedTask))
                  : moor.Value.absent(),
              // taskProgress: //add later maybe
            );
            taskDao.insertTask(newTask);
            // print("IM HEEEEEEREEEEEEE $count");
          }
        } else
          return;
      } else
        return;
    } catch (e) {
      print("insertTasks error: $e");
    }
  }

  // static Future<String> getServerNameById(int id) async {
  //   List<Server> tmp = await serverDao.getServers();
  //   for (Server server in tmp) {
  //     if (server.serverId == id) {
  //       return server.serverName;
  //     }
  //   }
  // }

  static Future<int> getUserIdInteger() async {
    List<User> tmp = await userDao.getUserData();
    if (tmp.length > 0)
      return tmp[0].userId;
    else
      return null;
  }

  static Future<int> getUserLastServer() async {
    var tmp = await userDao.getUserData();
    if (tmp.length > 0) if (tmp[0].userLastServer != null)
      return tmp[0].userLastServer;
    else
      return -1;
    else
      return -1;
  }

  static Future insertUserLastServer(int serverId) async {
    int userId = await DBFunctions.getUserIdInteger();
    if (userId != null)
      userDao.insertUserLastServer(serverId, userId);
    else {
      // print("user id is null. DBFunctions insertUserLastServer");
    }
    return;
  }

  static Future getUsername() async {
    List tmp = await userDao.getUserData();
    if (tmp.length > 0) {
      return tmp[0].userName;
    } else
      return "USER_NAME";
  }

  static Future getUserEmail() async {
    var tmp = await userDao.getUserData();
    return tmp[0].userEmail;
  }

  static Future getUserNickname() async {
    List<User> tmp = await userDao.getUserData();
    if (tmp.length > 0) {
      return tmp[0].userNickname;
    } else
      return "USER_NICKNAME";
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
      // print(tmp1);
      return tmp1;
    }
  }

  static Future getUserDetails() async {
    var tmp = await userDao.getUserData();
    return tmp;
  }

  static Future<List<Server>> getUserServers() async {
    var tmp = await serverDao.getServers();
    // print(tmp);
    return tmp;
  }

  static Future getUserTasks() async {
    List<Task> tmp = await taskDao.getTasks();
    // print(tmp);
    return tmp;
  }

  static Future getServerTasks(int serverId) async {
    List<Task> tmp = await taskDao.getServerTasks(serverId);
    // print("serverTasks are : \n $tmp");
    return tmp;
  }

  static Future deleteTaskById(int taskId) async {
    print(await taskDao.deleteTask(taskId));
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
