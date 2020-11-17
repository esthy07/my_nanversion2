import 'package:flutter/material.dart';

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
        backgroundColor: Colors.white,
        title: Text(
          "Mes Notes",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        bottom: TabBar(
          indicatorColor: Color(0xff983298),
          labelColor: Colors.black,
          labelStyle: TextStyle(fontSize: 16),
          indicatorSize: TabBarIndicatorSize.tab,
          controller: tabController,
          tabs: <Widget>[
            Tab(
              text: "Mes Quiz",
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
