// To parse this JSON data, do
//
//     final servermodel = servermodelFromJson(jsonString);

import 'dart:convert';

import 'package:taskmanager/Models/user_model.dart';

import 'task_model.dart';

Servermodel servermodelFromJson(String str) =>
    Servermodel.fromJson(json.decode(str));

String servermodelToJson(Servermodel data) => json.encode(data.toJson());

class Servermodel {
  Servermodel(
      {this.serverId,
      this.serverName,
      this.serverCode,
      this.serverOwnerId,
      this.serverTasks,
      this.serverMembers});

  String serverId;
  String serverName;
  String serverCode;
  String serverOwnerId;
  List<Taskmodel> serverTasks;
  List<Usermodel> serverMembers;

  factory Servermodel.fromJson(Map<String, dynamic> json) => Servermodel(
        serverId: json["serverId"] == null ? null : json["serverId"],
        serverName: json["serverName"] == null ? null : json["serverName"],
        serverCode: json["serverCode"] == null ? null : json["serverCode"],
        serverOwnerId:
            json["serverOwnerId"] == null ? null : json["serverOwnerId"],
        serverTasks: json["serverTasks"] == null
            ? null
            : List<Taskmodel>.from(
                json["serverTasks"].map((x) => Taskmodel.fromJson(x))),
        serverMembers: json["serverMembers"] == null
            ? null
            : List<Usermodel>.from(
                json["serverMembers"].map((x) => Usermodel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "serverId": serverId == null ? null : serverId,
        "serverName": serverName == null ? null : serverName,
        "serverCode": serverCode == null ? null : serverCode,
        "serverOwnerId": serverOwnerId == null ? null : serverOwnerId,
        "serverTasks": serverTasks == null
            ? null
            : List<dynamic>.from(serverTasks.map((x) => x.toJson())),
        "serverMembers": serverMembers == null
            ? null
            : List<dynamic>.from(serverMembers.map((x) => x.toJson())),
      };
}
