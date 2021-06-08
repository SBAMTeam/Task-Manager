import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Components/text_builder.dart';

class CardBuilder extends StatelessWidget {
  const CardBuilder(
      {Key key,
      @required this.taskTitle,
      @required this.taskDetails,
      @required this.taskStartDate,
      @required this.taskDeadline,
      this.onLongPress})
      : super(key: key);
  final taskTitle, taskDetails, taskStartDate, taskDeadline, onLongPress;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Color(buttonColorTwo),
      splashColor: Color(buttonColorTwo),
      borderRadius: BorderRadius.circular(8),
      onLongPress: onLongPress ?? null,
      child: Container(
        padding: defaultPadding,
        height: Get.height / 4.5,
        width: Get.width / 1.5,
        margin: EdgeInsets.only(right: 8, bottom: 8, top: 8),
        decoration: BoxDecoration(
            color: Color(buttonColorTwo),
            borderRadius: BorderRadius.circular(9),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 4,
                offset: Offset(1, 3),
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: TextBuilder(
                text: "$taskTitle" ?? "TASK_TITLE",
                fontWeight: FontWeight.bold,
                maxLines: 1,
                // minFontSize: 20,
                // fontSize: 20,
              ),
            ),
            Container(
              child: TextBuilder(
                text: taskDetails.length < 1
                    ? "No details specified."
                    : taskDetails,
                fontWeight: FontWeight.bold,
                maxLines: taskDetails.length < 2 ? 1 : 2,
                // minFontSize: 20,
              ),
              height: 25,
              width: Get.width,
            ),
            Container(
              child: TextBuilder(
                text: "Start Date: " + taskDeadline ?? "START_DATE",
                // fontWeight: FontWeight.bold,
                fontSize: 20,
                maxLines: 2,
              ),
              height: 25,
              width: Get.width,
            ),
            Container(
              child: TextBuilder(
                text: "Deadline: " + taskStartDate ?? "DEADLINE",
                // fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              height: 25,
              width: Get.width,
            ),
          ],
        ),
      ),
    );
  }
}
