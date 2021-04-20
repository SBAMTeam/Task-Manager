// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:taskmanager/Controllers/server_controller.dart';
// import 'package:taskmanager/Controllers/task_controller.dart';
// import 'package:taskmanager/Database/db_functions.dart';
// import 'package:taskmanager/Models/server_model.dart';

// import 'package:taskmanager/View/Components/functions.dart';
// import 'package:taskmanager/View/Components/text_builder.dart';

// import 'package:taskmanager/View/Pages/tasks_list.dart';

// import 'constants.dart';

// class ServerListBuilder extends GetView<ServerController> {
//   const ServerListBuilder({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     controller.getUserServersFromDB();
//     return Obx(() {
//       if (controller.isLoading.value == true) {
//         // if (controller.taskList.length < 1) {
//         int offset = 0;
//         int time = 800;
//         int count = Get.height ~/ 120;
//         return ListView.builder(
//           itemCount: controller.serverList.length,
//           scrollDirection: Axis.vertical,
//           controller: ScrollController(),
//           shrinkWrap: true,
//           itemBuilder: (context, index) {
//             return Container(
//               padding: EdgeInsets.symmetric(horizontal: 8),
//               // margin: EdgeInsets.symmetric(vertical: 5),
//               child: TextButton(
//                 onPressed: () async {
//                   int serverId;
//                   serverId = (controller.serverList[index].serverId);

//                   Get.to(() => TasksList(serverId: serverId));
//                 },
//                 child: Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       height: 100,
//                       width: 100,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20.0),
//                         child: Image.network(
//                             "http://via.placeholder.com/360"),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 8,
//                     ),
//                     Center(
//                       child: Text(
//                         controller.serverList[index].serverName,
//                         style: TextStyle(fontSize: 18),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       } else if (true) {
//         return Center(
//           child: TextBuilder(
//             text: "No servers! try creating or joining one.",
//             color: Colors.white,
//             fontSize: 22,
//           ),
//         );
//       }
//     });
//   }
// }
