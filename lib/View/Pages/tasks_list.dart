import 'package:flutter/material.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/task_list_builder_stateless.dart';
import 'package:taskmanager/View/Components/text_builder.dart';
import 'package:taskmanager/View/Pages/create_task.dart';

class TasksList extends StatelessWidget {
  final serverId;
  const TasksList({Key key, this.serverId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(() => CreateTask(
                    serverId: serverId,
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
              TaskListBuilder(
                serverId: serverId,
              )
            ],
          ),
        ),
      ),
    );
  }
}
