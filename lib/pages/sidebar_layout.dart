import 'package:flutter/material.dart';
import 'package:socialfoody/pages/ProfilePage.dart';
import 'package:socialfoody/pages/sideBar.dart';

class SideBarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ProfilePage(),
          SideBar(),

        ],
      ),
    );
  }
}