// To parse this JSON data, do
//
//     final taskmodel = taskmodelFromJson(jsonString);

import 'dart:convert';

Taskmodel taskmodelFromJson(String str) => Taskmodel.fromJson(json.decode(str));

String taskmodelToJson(Taskmodel data) => json.encode(data.toJson());

class Taskmodel {
  Taskmodel({
    this.taskId,
    this.taskName,
    this.taskDetails,
    this.taskStartDate,
    this.taskDeadline,
    this.taskUserId,
    this.taskServerId,
  });

  String taskId;
  String taskName;
  String taskDetails;
  String taskStartDate;
  String taskDeadline;
  String taskUserId;
  String taskServerId;

  factory Taskmodel.fromJson(Map<String, dynamic> json) => Taskmodel(
        taskId: json["taskId"],
        taskName: json["taskName"],
        taskDetails: json["taskDetails"],
        taskStartDate: json["taskStartDate"],
        taskDeadline: json["taskDeadline"],
        taskUserId: json["taskUserId"],
        taskServerId: json["taskServerId"],
      );

  Map<String, dynamic> toJson() => {
        "taskId": taskId,
        "taskName": taskName,
        "taskDetails": taskDetails,
        "taskStartDate": taskStartDate,
        "taskDeadline": taskDeadline,
        "taskUserId": taskUserId,
        "taskServerId": taskServerId,
      };
}
