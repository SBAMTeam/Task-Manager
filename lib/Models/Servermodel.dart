// To parse this JSON data, do
//
//     final servermodel = servermodelFromJson(jsonString);

import 'dart:convert';

import 'package:moor_flutter/moor_flutter.dart';

Servermodel servermodelFromJson(String str) =>
    Servermodel.fromJson(json.decode(str));

String servermodelToJson(Servermodel data) => json.encode(data.toJson());

class Servermodel extends Table {
  Servermodel({
    this.serverId,
    this.serverName,
    this.serverCode,
    this.serverOwnerId,
  });

  String serverId;
  String serverName;
  String serverCode;
  String serverOwnerId;

  factory Servermodel.fromJson(Map<String, dynamic> json) => Servermodel(
        serverId: json["serverId"] == null ? null : json["serverId"],
        serverName: json["serverName"] == null ? null : json["serverName"],
        serverCode: json["serverCode"] == null ? null : json["serverCode"],
        serverOwnerId:
            json["serverOwnerId"] == null ? null : json["serverOwnerId"],
      );

  Map<String, dynamic> toJson() => {
        "serverId": serverId == null ? null : serverId,
        "serverName": serverName == null ? null : serverName,
        "serverCode": serverCode == null ? null : serverCode,
        "serverOwnerId": serverOwnerId == null ? null : serverOwnerId,
      };
}
