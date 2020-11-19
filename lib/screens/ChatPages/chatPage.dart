import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Constantes/customeTheme.dart';
import '../../Constantes/customeTheme.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final deviceHeigh = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    Widget rdp(String rdse) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    rdse,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text('12:24',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Icon(Icons.check, size: 12),
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    Widget msg(String msg) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  constraints: BoxConstraints(
                    minWidth: deviceWidth / 2,
                    maxWidth: deviceWidth / 1.5,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      color: Theme.of(context).primaryColor),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    msg,
                    softWrap: true,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text('12:24',
                        style: TextStyle(fontSize: 10, color: Colors.grey)),
                    Icon(Icons.check, size: 12),
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'ChatRoom',
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {
                // Scaffold.of(context).showSnackBar(SnackBar());
              })
        ],
      ),
      body: Container(
        height: deviceHeigh - 100,
        child: Column(
          children: <Widget>[
            // Container(
            //   height: deviceWidth *.2,
            //   color: primaryColor,
            // ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'assets/images/backgroundNaN.png',
                    ),
                  ),
                ),
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Aujourd'hui",
                                style: TextStyle(color: Colors.grey),
                              ),
                            )
                          ],
                        ),
                        msg("Bonjour c'est patrick Bonjour tu vas bien ? je suis un peu occupé on cause après Bonjour c'est patrick Bonjour tu vas bien ? je suis un peu occupé on cause après Bonjour c'est patrick Bonjour tu vas bien ? je suis un peu occupé on cause après Bonjour c'est patrick Bonjour tu vas bien ? je suis un peu occupé on cause après Bonjour c'est patrick Bonjour tu vas bien ? je suis un peu occupé on cause après Bonjour c'est patrick Bonjour tu vas bien ? je suis un peu occupé on cause après Bonjour c'est patrick Bonjour tu vas bien ? je suis un peu occupé on cause après Bonjour c'est patrick Bonjour tu vas bien ? je suis un peu occupé on cause après "),
                        rdp("Bonjour tu vas bien ? je suis un peu occupé on cause après"),
                        msg('oui et toi?'),
                        msg("Bien et toi ?"),
                        rdp("Bonjour tu vas bien ? je suis un peu occupé on cause après"),
                        rdp("Bonjour tu vas bien ? je suis un peu occupé on cause après"),
                        rdp("Bonjour tu vas bien ? je suis un peu occupé on cause après"),
                        msg('oui et toi?'),
                        msg("Bien et toi ?"),
                        rdp("Bonjour"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.3,
                  alignment: Alignment.center,
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Taper votre message',
                        border: InputBorder.none),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    try {
                      _firestore.collection('messages').add({
                        "message": "Bonjour le monde c'est patrick",
                        "sender": "patrick@gmail.com"
                      });
                    } catch (e) {
                      print("Error ");
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
