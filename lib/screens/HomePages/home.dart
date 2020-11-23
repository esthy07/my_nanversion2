import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBarView.dart';
import 'package:motion_tab_bar/MotionTabController.dart';
import 'package:motion_tab_bar/motiontabbar.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/screens/ChatPages/chatPage.dart';
import 'package:mynan/screens/ChatPages/listMessage.dart';
import 'package:mynan/screens/HomePages/modifierProfil.dart';
import 'package:mynan/screens/HomePages/profile9.dart';
import 'package:mynan/screens/HomePages/recherche.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../../Provider/UserProv.dart';
import '../HomePages/homePage.dart';

class Home extends StatefulWidget {
  static const routeName = "home";
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final _auth = FirebaseAuth.instance;

  MotionTabController _tabController;
  List<Widget> allPages = [
    HomePage(),
    Recherche(),
    ListMessage(),
    ModifierProfil()
  ];
  final _firestore = FirebaseFirestore.instance;
  @override
  void initState() {
    super.initState();
    getCurentUser();
    getMessage();
    _tabController = MotionTabController(
        initialIndex: 0, vsync: this, length: allPages.length);
  }

  void getCurentUser() async {
    final user = _auth.currentUser;
    if (user != null) {
      await Provider.of<UserProv>(context, listen: false).getUser();
      await Provider.of<UserProv>(context, listen: false)
          .getOneUser(user.email);
    }
  }

  void getMessage() async {
    print("GET DDD");
    // _firestore
    //     .collection("salons").where("sender",arrayContainsAny: "patrick")
    //     .get()
    //     .then((value) {
    //   print('zzzzzzzzzzzzzzz');
    //   print(value.docs);
      
    // });
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
          labels: ["Home", "Search", "Chat", "Profil"],
          initialSelectedTab: "Home",
          tabIconColor: primaryColor,
          tabSelectedColor: primaryColor,
          onTabItemSelected: (int value) {
            print(value);
            setState(() {
              _tabController.index = value;
            });
          },
          icons: [Icons.home, Icons.search, Icons.chat, Icons.dashboard],
          textStyle: TextStyle(
              color: primaryColor,
              fontFamily: 'Barlow',
              fontWeight: FontWeight.w500),
        ),
        body: MotionTabBarView(controller: _tabController, children: allPages));
  }
}
