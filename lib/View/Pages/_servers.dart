import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taskmanager/Database/_db_functions.dart';
import 'package:moor_flutter/moor_flutter.dart' as moor;
import 'package:taskmanager/Database/database.dart';
import 'package:taskmanager/Models/Servermodel.dart';
import 'package:taskmanager/Models/Usermodel.dart';

class ServersList extends StatelessWidget {
  const ServersList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    return Scaffold(
      body: TextButton(
        child: Center(
          child: Text(
            "asdsaddas",
            style: TextStyle(color: Colors.orange),
          ),
        ),
        onPressed: () async {
          print(await DBFunctions.getServerOwnerIdInteger("6VN0RJ"));
        },
      ),
    );
  }
}
