import 'package:flutter/material.dart';
import 'package:mynan/screens/ChatPages/detailListMessage.dart';


class ListMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'MyNan',
          style: TextStyle(color: Colors.purple, fontSize: 20),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.purple,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.purple,
              ),
              onPressed: () {}),
        ],
      ),
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
