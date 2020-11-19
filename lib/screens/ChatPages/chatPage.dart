import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessageStream();
  }

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  TextEditingController messageText = TextEditingController();
  static const menuItems = <String>[
    'One',
    'Two',
  ];

  void getMessage() async {
    final messages = await _firestore.collection("messages").get();
    for (var i in messages.docs) {
      print(i.data());
    }
  }

  void getMessageStream() async {
    await for (var snapshot in _firestore.collection("messages").snapshots()) {
      for (var i in snapshot.docs) {
        print(i.data());
      }
    }
  }

  String _btn3SelectedVal;
  final List<PopupMenuItem<String>> _popUpMenuItems = menuItems
      .map(
        (String value) => PopupMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'ChatRoom',
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String newValue) {
              _btn3SelectedVal = newValue;
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(_btn3SelectedVal),
                ),
              );
            },
            itemBuilder: (BuildContext context) => _popUpMenuItems,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/backgroundNaN.png'),
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
                      reightMessage(context,
                          "Bonjour tu vas bien ? je suis un peu occupé on cause après bien ? je suis un peu occupé on cause après bien ? je suis un peu occupé on cause après"),
                      leftMessage(context, "Bonjous"),
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
                  controller: messageText,
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
                  _firestore.collection('messages').add({
                    "message": messageText.text,
                    "sender": _auth.currentUser.email
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
