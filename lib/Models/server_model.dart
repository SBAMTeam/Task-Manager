// To parse this JSON data, do
//
//     final servermodel = servermodelFromJson(jsonString);

import 'dart:convert';

import 'task_model.dart';

Servermodel servermodelFromJson(String str) =>
    Servermodel.fromJson(json.decode(str));

String servermodelToJson(Servermodel data) => json.encode(data.toJson());

class Servermodel {
  Servermodel({
    this.serverId,
    this.serverName,
    this.serverCode,
    this.serverOwnerId,
    this.userTasks,
  });

  String serverId;
  String serverName;
  String serverCode;
  String serverOwnerId;
  List<Taskmodel> userTasks;

  factory Servermodel.fromJson(Map<String, dynamic> json) => Servermodel(
        serverId: json["serverId"] == null ? null : json["serverId"],
        serverName: json["serverName"] == null ? null : json["serverName"],
        serverCode: json["serverCode"] == null ? null : json["serverCode"],
        serverOwnerId:
            json["serverOwnerId"] == null ? null : json["serverOwnerId"],
        userTasks: json["userTasks"] == null
            ? null
            : List<Taskmodel>.from(
                json["userTasks"].map((x) => Taskmodel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "serverId": serverId == null ? null : serverId,
        "serverName": serverName == null ? null : serverName,
        "serverCode": serverCode == null ? null : serverCode,
        "serverOwnerId": serverOwnerId == null ? null : serverOwnerId,
        "userTasks": userTasks == null
            ? null
            : List<dynamic>.from(userTasks.map((x) => x.toJson())),
      };
}
