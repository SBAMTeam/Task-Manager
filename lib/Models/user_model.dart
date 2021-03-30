// To parse this JSON data, do
//
//     final usermodel = usermodelFromJson(jsonString);

import 'dart:convert';

import 'server_model.dart';

Usermodel usermodelFromJson(String str) => Usermodel.fromJson(json.decode(str));

String usermodelToJson(Usermodel data) => json.encode(data.toJson());

class Usermodel {
  Usermodel({
    this.logMessages,
    this.userId,
    this.userName,
    this.userNickname,
    this.userEmail,
    this.userHash,
    this.jwt,
    this.userServers,
    this.userPermissions,
  });

  String logMessages;
  String userId;
  String userName;
  String userNickname;
  String userHash;
  String userEmail;
  String jwt;
  List<Servermodel> userServers;
  List<UserPermission> userPermissions;

  factory Usermodel.fromJson(Map<String, dynamic> json) => Usermodel(
        logMessages: json["LogMessages"],
        userId: json["userId"] == null ? null : json["userId"],
        userName: json["userName"],
        userNickname: json["userNickname"],
        userEmail: json["userEmail"],
        userHash: json["userHash"] == null ? null : json["userHash"],
        jwt: json["jwt"],
        userServers: json["userServers"] == null
            ? null
            : List<Servermodel>.from(
                json["userServers"].map((x) => Servermodel.fromJson(x))),
        userPermissions: json["userPermissions"] == null
            ? null
            : List<UserPermission>.from(
                json["userPermissions"].map((x) => UserPermission.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "LogMessages": logMessages,
        "userId": userId,
        "userName": userName,
        "userNickname": userNickname,
        "userEmail": userEmail,
        "userHash": userHash == null ? null : userHash,
        "jwt": jwt,
        "userServers": userServers == null
            ? null
            : List<dynamic>.from(userServers.map((x) => x.toJson())),
        "userPermissions": userPermissions == null
            ? null
            : List<dynamic>.from(userPermissions.map((x) => x.toJson())),
      };
}

class UserPermission {
  UserPermission({
    this.permId,
    this.permName,
  });

  String permId;
  String permName;

  factory UserPermission.fromJson(Map<String, dynamic> json) => UserPermission(
        permId: json["permId"] == null ? null : json["permId"],
        permName: json["permName"] == null ? null : json["permName"],
      );

  Map<String, dynamic> toJson() => {
        "permId": permId == null ? null : permId,
        "permName": permName == null ? null : permName,
      };
}
