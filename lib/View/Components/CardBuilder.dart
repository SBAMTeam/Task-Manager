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
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: Get.height / 4.5,
      width: Get.width / 1.5,
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
        children: [
          TextBuilder(
            text: "TASK TITLE",
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          // SizedBox(
          //   height: Get.height / 100,
          // ),
          Container(
            width: Get.width / 1.7,
            child: TextBuilder(
              text: 'epsum bad epsum bad epsum bad epsum bad epsum bad',
              //   fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          // SizedBox(
          //   height: Get.height / 35,
          // ),
          TextBuilder(
            text: "Progress",
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ],
      ),
    );
  }
}
