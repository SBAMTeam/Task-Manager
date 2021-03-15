// To parse this JSON data, do
//
//     final servermodel = servermodelFromJson(jsonString);

import 'dart:convert';

List<Servermodel> serverModelFromJson(String str) => List<Servermodel>.from(
    json.decode(str).map((x) => Servermodel.fromJson(x)));

String servermodelToJson(Servermodel data) => json.encode(data.toJson());

class Servermodel {
  Servermodel({
    this.serverId,
    this.serverOwnerId,
    this.serverCode,
    this.serverName,
    this.userServers,
  });

  String serverId;
  String serverOwnerId;
  String serverCode;
  String serverName;
  List<UserServer> userServers;

  factory Servermodel.fromJson(Map<String, dynamic> json) => Servermodel(
        serverId: json["serverId"],
        serverOwnerId: json["serverOwnerId"],
        serverCode: json["serverCode"],
        serverName: json["serverName"],
        userServers: json["userServers"] == null
            ? null
            : List<UserServer>.from(
                json["userServers"].map((x) => UserServer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "serverId": serverId,
        "serverOwnerId": serverOwnerId,
        "serverCode": serverCode,
        "serverName": serverName,
        "userServers": userServers == null
            ? null
            : List<dynamic>.from(userServers.map((x) => x.toJson())),
      };
}

class UserServer {
  UserServer({
    this.serverId,
    this.serverName,
  });

  String serverId;
  String serverName;

  factory UserServer.fromJson(Map<String, dynamic> json) => UserServer(
        serverId: json["Server_id"] == null ? null : json["Server_id"],
        serverName: json["Server_name"] == null ? null : json["Server_name"],
      );

  Map<String, dynamic> toJson() => {
        "Server_id": serverId == null ? null : serverId,
        "Server_name": serverName == null ? null : serverName,
      };
}
