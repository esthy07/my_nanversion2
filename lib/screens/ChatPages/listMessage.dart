import 'package:flutter/material.dart';
import 'package:mynan/screens/ChatPages/detailListMessage.dart';
import 'package:mynan/widgets/drawer.dart';

import '../../Constantes/customeTheme.dart';


class ListMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
       centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(
          'myNaN',
          style: TextStyle(color: Colors.white, fontFamily: 'Barlow', fontSize: 20),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      drawer:DrawerPage(),
      body: ListView(
        
        children: [
          detailListMessage(context, "Flore Domi", "Salus ga on dit quoi",
              "14:22", "assets/images/jeune.jpg"),
          detailListMessage(context, "Sydney", "C'est comment bro tu vas bien",
              "14:22", "assets/images/jeune1.jpg"),
          detailListMessage(context, "Blaise", "Je t'attend hien ga", "18:00",
              "assets/images/jeune.jpg"),
          detailListMessage(context, "Blaise", "On se chop a nan,moi meme",
              "18:00", "assets/images/jeune1.jpg"),
          detailListMessage(context, "Flore Domi", "Salus ga on dit quoi",
              "14:22", "assets/images/jeune.jpg"),
          detailListMessage(context, "Sydney", "C'est comment bro tu vas bien",
              "14:22", "assets/images/jeune1.jpg"),
          detailListMessage(context, "Blaise", "Je t'attend hien ga", "18:00",
              "assets/images/jeune.jpg"),
          detailListMessage(context, "Blaise", "On se chop a nan,moi meme",
              "18:00", "assets/images/jeune1.jpg"),
        ],
      ),
    );
  }
}
