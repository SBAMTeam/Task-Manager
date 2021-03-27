import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmanager/View/Components/Constants.dart';

import 'package:taskmanager/View/Components/ExtraIcons.dart';
import 'package:taskmanager/View/Pages/HomePage.dart';
import 'package:taskmanager/View/Pages/SearchTasks.dart';

class NavBar extends StatelessWidget {
  NavBar({Key key}) : super(key: key);
  int _indexNum = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        backgroundColor: Color(backgroundColor),
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(color: Colors.white),
        selectedIconTheme: IconThemeData(color: Colors.white),
        fixedColor: Colors.white,
        unselectedItemColor: Colors.white38,
        currentIndex: _indexNum,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                ExtraIcons.fi_rr_home,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(ExtraIcons.fi_rr_search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(ExtraIcons.fi_rr_settings),
              label: 'Settings'),
        ],
        onTap: (index) {
          if (index == 0) Get.to(HomePage());
          if (index == 1) {
            _indexNum = index;
            Get.to(() => SearchTasks());
          }
          ;
        });
  }
}
