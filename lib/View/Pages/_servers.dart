import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/Usercontroller.dart';
import 'package:taskmanager/Models/Servermodel.dart';
import 'package:taskmanager/Models/Usermodel.dart';

class ServersList extends StatelessWidget {
  const ServersList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var servermodel = Servermodel();
    var usermodel = Usermodel();
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
          print(servermodel);
          servermodel.serverCode = "asdasd";
          servermodel.serverId = "asdasd";
          servermodel.serverOwnerId = "asdasd";
          usermodel.username = "Moe";
          usermodel.userhash = "NoneOfYourBusiness";

          print("imt return value of login");
          usermodel = Usermodel.fromJson(await UserController.login(usermodel));
          print(usermodel.toJson().toString());
        },
      ),
    );
  }
}
