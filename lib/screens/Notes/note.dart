import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';

import 'liveCoding.dart';
import 'projet.dart';
import 'quiz.dart';

class Revision extends StatefulWidget {

  static const routeName = 'Revision';

  @override
  _RevisionState createState() => _RevisionState();
}

class _RevisionState extends State<Revision>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 3, vsync: this);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(
          "Mes Notes",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Barlow'),
        ),
        bottom: TabBar(
          indicatorColor: primaryColor,
          labelColor: Colors.white            ,
          labelStyle: TextStyle(fontSize: 16, fontFamily: 'Baarlow', fontWeight: FontWeight.w500),
          indicatorSize: TabBarIndicatorSize.tab,
          controller: tabController,
          tabs: <Widget>[
            Tab(
              text: "Mes Quizz",
            ),
            Tab(
              text: "Mes Projes",
            ),
            Tab(
              text: "Mes LiveCoding",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: <Widget>[
          Quiz(),
          Projet(),
          LiveCoding(),
        ],
      ),
    );
  }
}
