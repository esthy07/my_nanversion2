import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/screens/HomePages/profile9.dart';
import 'package:mynan/screens/HomePages/recherche.dart';

import '../HomePages/homePage.dart';

class Home extends StatefulWidget {
  static const routeName = "home";
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  MotionTabController _tabController;
  List<Widget> allPages = [HomePage(),Recherche(),Recherche(),Profil()];
  @override
  void initState() {
    super.initState();
    _tabController = MotionTabController(initialIndex: 0, vsync: this,length: allPages.length);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: MotionTabBar(
          labels: ["Home", "Search", "Chat","Dashboard"],
          initialSelectedTab: "Home",
          tabIconColor: primaryColor,
          tabSelectedColor: primaryColor,
          onTabItemSelected: (int value) {
            print(value);
            setState(() {
              _tabController.index = value;
            });
          },
          icons: [Icons.home, Icons.search, Icons.chat,Icons.dashboard],
          textStyle: TextStyle(color: primaryColor),
        ),
        body: MotionTabBarView(
          controller: _tabController,
          children: allPages ));
    
  }
}
