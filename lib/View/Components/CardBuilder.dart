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
      @required this.taskDeadline})
      : super(key: key);
  final taskTitle, taskDetails, taskStartDate, taskDeadline;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: Get.height / 4.5,
      width: Get.width / 1.5,
      margin: EdgeInsets.all(8),
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
          TextBuilder(
            text: "$taskTitle" ?? "TASK_TITLE",
            fontWeight: FontWeight.bold,
            maxLines: 1,
            // minFontSize: 20,
            // fontSize: 20,
          ),

          Container(
            child: TextBuilder(
              text: taskDetails.length < 2
                  ? "No details specified."
                  : taskDetails,
              fontWeight: FontWeight.bold,
              maxLines: taskDetails.length < 2 ? 1 : 2,
              // minFontSize: 20,
            ),
          ),
          // SizedBox(
          //   height: Get.height / 35,
          // ),
          TextBuilder(
            text: "Start Date: $taskStartDate" ?? "START_DATE",
            // fontWeight: FontWeight.bold,
            fontSize: 20,
            maxLines: 2,
          ),
          TextBuilder(
            text: "Deadline: $taskDeadline" ?? "DEADLINE",
            // fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ],
      ),
    );
  }
}
