import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taskmanager/Controllers/task_controller.dart';
import 'package:taskmanager/View/Components/functions.dart';

import 'text_builder.dart';

class TaskListBuilder extends GetView<TaskController> {
  final serverId;
  const TaskListBuilder({
    Key key,
    @required this.serverId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.fetchUserServerTasks(serverId);
    return Obx(
      () {
        if (controller.isLoading.value == true) {
          // if (controller.taskList.length < 1) {
          int offset = 0;
          int time = 800;
          int count = Get.height ~/ 120;
          return SafeArea(
            child: ListView.builder(
              itemCount: count,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                offset += 5;
                time = 800 + offset;

                // print(time);
                double containerWidth = 280;
                double containerHeight = 20;

                return Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Shimmer.fromColors(
                      highlightColor: Colors.white,
                      baseColor: Colors.grey[300],
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 7.5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.grey,
                              ),
                              height: 100,
                              width: 100,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    color: Colors.grey,
                                  ),
                                  height: containerHeight,
                                  width: containerWidth,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      period: Duration(milliseconds: time),
                    ));
              },
            ),
          );
        } else if (controller.serverTasksList.length < 1) {
          return Center(
            child: TextBuilder(
              textAlign: TextAlign.center,
              text:
                  "No Tasks! Wait until you get assigned one, or create one yourself!",
              color: Colors.white,
              fontSize: 22,
            ),
          );
        } else {
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.serverTasksList.length ?? 0,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                // if (controller.taskList[index].serverId != serverId) {
                //   return SizedBox(
                //     height: 0,
                //   );
                // } else
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller
                                          .serverTasksList[index].taskName,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      controller
                                          .serverTasksList[index].taskDetails,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text(
                                      controller
                                          .serverTasksList[index].taskDeadline
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
