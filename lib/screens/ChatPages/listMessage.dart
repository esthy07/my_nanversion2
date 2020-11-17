import 'package:flutter/material.dart';
import 'package:mynan/screens/ChatPages/detailListMessage.dart';


class ListMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff10182b),
        title: Text(
          'MyNan',
          style: TextStyle(color: Colors.white, fontSize: 20),
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
      body: ListView(
        children: [
          detailListMessage(context, "Flore Domi", "Salus ga on dit quoi",
              "14:22", "images/jeune.jpg"),
          detailListMessage(context, "Sydney", "C'est comment bro tu vas bien",
              "14:22", "images/jeune1.jpg"),
          detailListMessage(context, "Blaise", "Je t'attend hien ga", "18:00",
              "images/dev.jpg"),
          detailListMessage(context, "Blaise", "On se chop a nan,moi meme",
              "18:00", "images/nan.png"),
          detailListMessage(context, "Flore Domi", "Salus ga on dit quoi",
              "14:22", "images/jeune.jpg"),
          detailListMessage(context, "Sydney", "C'est comment bro tu vas bien",
              "14:22", "images/jeune1.jpg"),
          detailListMessage(context, "Blaise", "Je t'attend hien ga", "18:00",
              "images/dev.jpg"),
          detailListMessage(context, "Blaise", "On se chop a nan,moi meme",
              "18:00", "images/nan.png"),
        ],
      ),
    );
  }
}
