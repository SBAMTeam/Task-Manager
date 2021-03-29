import 'package:flutter/material.dart';
import 'package:taskmanager/View/Components/Constants.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/TextBuilder.dart';
import 'package:taskmanager/View/Components/server_select.dart';

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
            children: [ServerSelect()],
          ),
        ),
      ),
    );
  }
}
