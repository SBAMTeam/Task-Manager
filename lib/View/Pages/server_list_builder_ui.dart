import 'package:flutter/material.dart';
import 'package:taskmanager/View/Components/NavigationBar.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Components/user_info_bar.dart';
import 'package:taskmanager/View/Pages/server_list.dart';

class ServersListUI extends StatelessWidget {
  const ServersListUI({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    serverController.fetchServers();
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [UserInfoBar(), ServersList()],
        ),
      )),
      // bottomNavigationBar: NavBar(),
    );
  }
}
