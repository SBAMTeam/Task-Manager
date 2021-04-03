import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/task_controller.dart';

class TaskListBuilder extends GetView<TaskController> {
  final serverId;
  const TaskListBuilder(this.serverId, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller.serverId(serverId);
    // controller.isLoadingReal(true);
    // controller.isLoadingAll(true);
    return Obx(
      () {
        if (controller.isLoading.value == true) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.taskList.length ?? 0,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                if (controller.taskList[index].serverId != serverId) {
                  return SizedBox(
                    height: 0,
                  );
                } else
                  return Container(
                    padding: EdgeInsets.only(top: 4),
                    child: TextButton(
                      onPressed: () {},
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                Flexible(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.taskList[index].taskName,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        controller.taskList[index].taskDetails,
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        controller.taskList[index].taskDeadline
                                            .toString(),
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Container(
                              height: 1,
                              color: Colors.grey.withAlpha(128),
                            ),
                          ]),
                    ),
                  );
              });
        }
      },
      // ),
    );
  }
}
