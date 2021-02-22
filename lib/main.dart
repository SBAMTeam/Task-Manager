import 'package:flutter/material.dart';
import 'package:taskmanager/Login.dart';
import 'package:get/get.dart';

main() => runApp(
      GetMaterialApp(
        theme: ThemeData(fontFamily: 'OpenSans'),
        home: Scaffold(
          backgroundColor: Color(0xffF0F0F0),
          body: Login(),
        ),
      ),
    );
