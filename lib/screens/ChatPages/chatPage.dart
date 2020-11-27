import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynan/model/UseurModel.dart';

import '../../Constantes/customeTheme.dart';

class ChatPage extends StatefulWidget {
  String image;
  String titre;
  String idSalon;

  ChatPage({this.idSalon, this.titre, this.image});
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  TextEditingController messageText = TextEditingController();
  static const menuItems = <String>[
    'One',
    'Two',
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessage();
  }

  void getMessage() async {
    print("get Salons");
    _firestore
        .collection("salons")
        .where(
          'id',
          isEqualTo: "RnEYxKdkD8srCYMNAkPy",
        )
        .get()
        .then((value) => print(value));
    // final listMessage = messages.doc().get();

    // print(listMessage);
    // for (var i in messages.docs) {
    //   print(i.data());
    // }
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
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(widget.image),
              radius: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * .02,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 2.5,
              child: Text(
                '${widget.titre}',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Barlow'
                ),
              ),
            ),
          ],
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
              child: StreamBuilder<QuerySnapshot>(
                  stream: _firestore
                      .collection("ChatRoom")
                      .doc(widget.idSalon)
                      .collection("chats")
                      .orderBy("dateAdd", descending: false)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator(
                        backgroundColor: primaryColor,
                      );
                    }
                    final messages = snapshot.data.docs.reversed;
                    List<Widget> messageList = [];
                    for (var message in messages) {
                      if (message.get("sender") == _auth.currentUser.email) {
                        messageList.add(
                            reightMessage(context, message.data()["message"]));
                      } else {
                        messageList.add(
                            leftMessage(context, message.data()["message"]));
                      }
                    }
                    return ListView(reverse: true, children: messageList);
                  }),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 60,
                    maxHeight: 100
                  ),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width / 1.3,
                  alignment: Alignment.center,
                  child: TextField(
                    maxLines: null,
                    controller: messageText,
                    decoration: InputDecoration(
                        hintText: 'Taper votre message',
                        border: InputBorder.none),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  _firestore
                      .collection("ChatRoom")
                      .doc(widget.idSalon)
                      .collection("chats")
                      .add({
                    "message": messageText.text,
                    "sender": _auth.currentUser.email,
                    "dateAdd": DateTime.now(),
                    "isRead": false,
                  });
                  messageText.clear();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
