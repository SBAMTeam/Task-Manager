import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/Constants.dart';
import 'package:taskmanager/View/Pages/Login.dart';
import 'package:taskmanager/View/Pages/Register.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/CreateServer.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/JoinServer.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/LoggedInPage.dart';
// ignore: unused_import
import 'package:taskmanager/View/Pages/MainPage.dart';

main() => runApp(
      GetMaterialApp(
        theme: ThemeData(
          fontFamily: 'Nunito',
        ),
        home: Scaffold(
          backgroundColor: Color(backgroundColor),
          body: MainPage(),
        ),
      ),
    );
