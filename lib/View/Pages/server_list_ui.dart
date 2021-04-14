import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/Controllers/server_controller.dart';
import 'package:taskmanager/View/Components/NavigationBar.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Components/server_list_builder.dart';
import 'package:taskmanager/View/Components/user_info_bar.dart';
import 'package:taskmanager/View/Pages/server_list.dart';
import 'package:get/get.dart';

class ServersListUI extends GetView<ServerController> {
  const ServersListUI({Key key, this.firstEntry}) : super(key: key);
  final firstEntry;
  @override
  Widget build(BuildContext context) {
    controller.fetchServers();
    return Scaffold(
      backgroundColor: Color(backgroundColor),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: defaultPadding,
          child: Column(
            children: [
              UserInfoBar(),
              Container(
                padding: EdgeInsets.only(top: 16),
                child: Row(
                  children: [
                    Flexible(
                      child: AutoSizeText(
                        'My Servers',
                        style: TextStyle(
                            // fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        textScaleFactor: 2,
                      ),
                    ),
                  ],
                ),
              ),
              ServerListBuilder(firstEntry)
            ],
          ),
        ),
      )),
      // bottomNavigationBar: NavBar(),
    );
  }
}
