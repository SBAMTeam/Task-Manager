import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/Constants.dart';

// ignore: unused_import
import 'package:taskmanager/View/Pages/CreateServer.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/JoinServer.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/LoggedInPage.dart';
import 'package:taskmanager/View/Pages/Login.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/MainPage.dart';

main() => runApp(
      GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'Nunito',
        ),
        home: Scaffold(
          backgroundColor: Color(backgroundColor),
          body: JoinServer(),
        ),
      ),
    );
