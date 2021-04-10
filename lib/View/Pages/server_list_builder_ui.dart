import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/View/Components/NavigationBar.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Components/server_list_builder.dart';
import 'package:taskmanager/View/Components/user_info_bar.dart';
import 'package:taskmanager/View/Pages/server_list.dart';
import 'package:get/get.dart';

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
          children: [
            UserInfoBar(),
            Row(
              children: [
                Container(
                  child: Flexible(
                      child: AutoSizeText(
                    'My Servers',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )),
                  padding: EdgeInsets.symmetric(
                      horizontal: Get.width / 16),
                ),
              ],
            ),
            ServerListBuilder()
          ],
        ),
      )),
      // bottomNavigationBar: NavBar(),
    );
  }
}
