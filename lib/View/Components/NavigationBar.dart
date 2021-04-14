import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/Controllers/navigation_controller.dart';
import 'package:taskmanager/View/Components/constants.dart';
import 'package:taskmanager/View/Components/ExtraIcons.dart';
import 'package:taskmanager/View/Components/server_list_builder.dart';

import 'package:taskmanager/View/Pages/SearchTasks.dart';
import 'package:taskmanager/View/Pages/server_list_ui.dart';
import 'package:taskmanager/View/Pages/server_page.dart';

class NavBar extends StatelessWidget {
  final NavigationController navcontroller = Get.put(NavigationController());
  final List<Widget> bodyContent = [
    HomePage(
      serverId: userController.userLastServer.value,
    ),
    ServersListUI()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => bodyContent.elementAt(navcontroller.selectedTab),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
            backgroundColor: Color(backgroundColor),
            showUnselectedLabels: false,
            selectedLabelStyle: TextStyle(color: Colors.white),
            selectedIconTheme: IconThemeData(color: Colors.white),
            fixedColor: Colors.white,
            elevation: 0,
            unselectedItemColor: Colors.white38,
            currentIndex: navcontroller.selectedTab,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    ExtraIcons.fi_rr_home,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dns_outlined), label: 'Servers'),
              BottomNavigationBarItem(
                  icon: Icon(ExtraIcons.fi_rr_settings), label: 'Settings'),
            ],
            onTap: (index) => navcontroller.selectedTab = index),
      ),
    );
  }
}
