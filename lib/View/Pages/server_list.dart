import 'package:flutter/material.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/text_builder.dart';
import 'package:taskmanager/View/Components/server_ui.dart';

class ServersList extends StatefulWidget {
  ServersList({Key key}) : super(key: key);

  @override
  _ServersListState createState() => _ServersListState();
}

class _ServersListState extends State<ServersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(backgroundColor),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [ServerUI()],
          ),
        ),
      ),
    );
  }
}
