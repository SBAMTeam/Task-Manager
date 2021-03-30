import 'package:flutter/material.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/task_ui.dart';
import 'package:taskmanager/View/Components/text_builder.dart';
import 'package:taskmanager/View/Components/server_ui.dart';
import 'package:taskmanager/View/Pages/createtask.dart';

class TasksList extends StatefulWidget {
  TasksList({Key key, @required this.serverId}) : super(key: key);
  final int serverId;
  @override
  _TasksListState createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(() => CreateTask(
                    serverId: widget.serverId,
                  ));
            },
          )
        ],
      ),
      // backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TaskUI(
                serverId: widget.serverId,
              )
            ],
          ),
        ),
      ),
    );
  }
}
