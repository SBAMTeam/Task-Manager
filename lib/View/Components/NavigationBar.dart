import 'package:flutter/material.dart';

import 'package:taskmanager/View/Components/ExtraIcons.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(ExtraIcons.fi_rr_home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(ExtraIcons.fi_rr_search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(ExtraIcons.fi_rr_home), label: 'Settings'),
        ],
      ),
    );
  }
}
