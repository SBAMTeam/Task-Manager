// To parse this JSON data, do
//
//     final fetchTasksModelTemporary = fetchTasksModelTemporaryFromJson(jsonString);

import 'dart:convert';

FetchTasksModelTemporary fetchTasksModelTemporaryFromJson(String str) =>
    FetchTasksModelTemporary.fromJson(json.decode(str));

String fetchTasksModelTemporaryToJson(FetchTasksModelTemporary data) =>
    json.encode(data.toJson());

class FetchTasksModelTemporary {
  FetchTasksModelTemporary({
    this.serverId,
    this.userId,
  });

  String serverId;
  String userId;

  factory FetchTasksModelTemporary.fromJson(Map<String, dynamic> json) =>
      FetchTasksModelTemporary(
        serverId: json["serverId"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "serverId": serverId,
        "userId": userId,
      };
}
