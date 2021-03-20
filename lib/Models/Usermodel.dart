// To parse this JSON data, do
//
//     final usermodel = usermodelFromJson(jsonString);

import 'dart:convert';

Usermodel usermodelFromJson(String str) => Usermodel.fromJson(json.decode(str));

String usermodelToJson(Usermodel data) => json.encode(data.toJson());

class Usermodel {
  Usermodel({
    this.logMesseges,
    this.userId,
    this.username,
    this.userEmail,
    this.jwt,
    this.userhash,
    this.userNickname,
    this.userServers,
    this.userPermissions,
  });

  String logMesseges;
  String userId;
  String username;
  String userEmail;
  String jwt;
  String userhash;
  String userNickname;
  List<User> userServers;
  List<User> userPermissions;

  factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        logMesseges: json["logMesseges"],
        userId: json["userId"],
        username: json["username"],
        userEmail: json["userEmail"],
        jwt: json["jwt"],
        userhash: json["userhash"],
        userNickname: json["userNickname"],
        userServers: json["userServers"] == null
            ? null
            : List<User>.from(json["userServers"].map((x) => User.fromJson(x))),
        userPermissions: json["userPermissions"] == null
            ? null
            : List<User>.from(
                json["userPermissions"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "logMesseges": logMesseges == null ? null : logMesseges,
        "userId": userId == null ? null : userId,
        "username": username == null ? null : username,
        "userEmail": userEmail == null ? null : userEmail,
        "jwt": jwt == null ? null : jwt,
        "userhash": userhash == null ? null : userhash,
        "userNickname": userNickname == null ? null : userNickname,
        "userServers": userServers == null
            ? null
            : List<dynamic>.from(userServers.map((x) => x.toJson())),
        "userPermissions": userPermissions == null
            ? null
            : List<dynamic>.from(userPermissions.map((x) => x.toJson())),
      };
}

class User {
  User({
    this.serverId,
    this.serverName,
  });

  String serverId;
  String serverName;

  factory User.fromJson(Map<String, dynamic> json) => User(
        serverId: json["Server_id"] == null ? null : json["Server_id"],
        serverName: json["Server_name"] == null ? null : json["Server_name"],
      );

  Map<String, dynamic> toJson() => {
        "Server_id": serverId == null ? null : serverId,
        "Server_name": serverName == null ? null : serverName,
      };
}
