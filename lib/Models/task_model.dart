// To parse this JSON data, do
//
//     final taskmodel = taskmodelFromJson(jsonString);

import 'dart:convert';

Taskmodel taskmodelFromJson(String str) => Taskmodel.fromJson(json.decode(str));

String taskmodelToJson(Taskmodel data) => json.encode(data.toJson());

class Taskmodel {
  Taskmodel(
      {this.taskId,
      this.taskName,
      this.taskDetails,
      this.taskStartDate,
      this.taskDeadline,
      this.taskUserId,
      this.taskCreatorId,
      this.taskServerId,
      this.userAssignedTask});

  String taskId;
  String taskName;
  String taskDetails;
  String taskStartDate;
  String taskDeadline;
  String taskUserId;
  String taskCreatorId;
  String taskServerId;
  String userAssignedTask;

  factory Taskmodel.fromJson(Map<String, dynamic> json) => Taskmodel(
        taskId: json["taskId"],
        taskName: json["taskName"],
        taskDetails: json["taskDetails"],
        taskStartDate: json["taskStartDate"],
        taskDeadline: json["taskDeadline"],
        taskUserId: json["taskUserId"],
        taskCreatorId: json["taskCreatorId"],
        taskServerId: json["taskServerId"],
        userAssignedTask:
            json["userAssignedTask"] == null ? null : json["userAssignedTask"],
      );

  Map<String, dynamic> toJson() => {
        "taskId": taskId,
        "taskName": taskName,
        "taskDetails": taskDetails,
        "taskStartDate": taskStartDate,
        "taskDeadline": taskDeadline,
        "taskUserId": taskUserId,
        "taskCreatorId": taskCreatorId,
        "taskServerId": taskServerId,
        "userAssignedTask": userAssignedTask == null ? null : userAssignedTask
      };
}
