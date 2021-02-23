import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/Constants.dart';
import 'package:taskmanager/View/Pages/CreateServer.dart';
import 'package:taskmanager/View/Pages/Login.dart';
import 'package:taskmanager/View/Pages/MainPage.dart';

main() => runApp(
      GetMaterialApp(
        theme: ThemeData(fontFamily: 'OpenSans'),
        home: Scaffold(
          backgroundColor: Color(backgroundColor),
          body: MainPage(),
        ),
      ),
    );
