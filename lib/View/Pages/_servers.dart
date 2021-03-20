import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/Usercontroller.dart';
import 'package:taskmanager/Database/UserDB.dart';
import 'package:taskmanager/Models/Servermodel.dart';
import 'package:taskmanager/Models/Usermodel.dart';
import 'package:taskmanager/Models/UsermodelNoPassword.dart';

class ServersList extends StatelessWidget {
  const ServersList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var servermodel = Servermodel();
    var usermodel = Usermodel();
    var usermodelNoPassword = UsermodelNoPassword();
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

          usermodel.username = "asdasdasd";
          usermodel.userId = "3";
          usermodel.jwt = "123123123";

          usermodelNoPassword =
              UsermodelNoPassword.fromJson(usermodel.toJson());
          try {
            await DatabaseHelper.instance.insert(usermodelNoPassword.toJson());
            print(await DatabaseHelper.instance.queryAll());
          } catch (e) {
            print(e);
          }
          print("imt return value of login");
          var a = await UserController.login(usermodel);
          if (a is int) {
            print("Server error $a");
          } else {
            usermodelNoPassword =
                UsermodelNoPassword.fromJson(usermodel.toJson());
            var jsonUsermodel = usermodel.toJson();
            // print(usermodel.toJson());
            print(jsonUsermodel);
            print("im no pass");
            print(usermodelNoPassword.toJson());
          }
        },
      ),
    );
  }
}
