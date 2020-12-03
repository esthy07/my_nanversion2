import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynan/Provider/UserProv.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:mynan/widgets/chatWidget/leftMessage.dart';
import 'package:mynan/widgets/chatWidget/reightMessage.dart';
import 'package:provider/provider.dart';

import '../../Constantes/customeTheme.dart';

class ChatPage extends StatefulWidget {
  String image;
  String titre;
  String idSalon;
  String otherEmail;

  ChatPage({this.idSalon, this.titre, this.image, this.otherEmail});
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  TextEditingController messageText = TextEditingController();
  final assetsAudioPlayer = AssetsAudioPlayer();
  UserModel currentUser;
  bool isEnligne = false;
  static const menuItems = <String>[
    'Afficher contact',
    'Supprimer la discution',
  ];

  void setEnLigne(bool enlign) {
    _firestore
        .collection("ChatRoom")
        .doc(widget.idSalon)
        .collection("enLigne")
        .doc(currentUser.email)
        .update({"enLigne": enlign, "dateLigne": DateTime.now()});
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
    currentUser = Provider.of<UserProv>(context).loggedInUser;
    setEnLigne(true);
    return WillPopScope(
      onWillPop: () async {
        setEnLigne(false);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                setEnLigne(false);
                Navigator.of(context).pop();
              }),
          title: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Color.fromRGBO(16, 24, 43, 1),
                backgroundImage: NetworkImage(widget.image),
                radius: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .02,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(
                      '${widget.titre}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Barlow',
                      ),
                    ),
                    StreamBuilder(
                        stream: _firestore
                            .collection("ChatRoom")
                            .doc(widget.idSalon)
                            .collection("enLigne")
                            .doc(widget.otherEmail)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            print("Is En lign ????");
                            print(snapshot.data["enLigne"]);
                            var timeEnvoi = snapshot.data["enLigne"];
                            //timeEnvoi = FormaterdateTo.getVerboseDateTime(timeEnvoi, DateTime.now());
                            isEnligne = snapshot.data["enLigne"];
                            return Text(
                              snapshot.data["enLigne"]
                                  ? "en ligne"
                                  : "${snapshot.data["dateLigne"]}",
                              style: TextStyle(fontSize: 12),
                            );
                          } else {
                            return Text("");
                          }
                        })
                  ],
                ),
              ),
            ],
          ),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: (String newValue) {
                if (newValue.trim() == "Supprimer la discution".trim()) {
                  _firestore
                      .collection("ChatRoom")
                      .doc(widget.idSalon)
                      .delete()
                      .then((value) => Navigator.of(context).pop());
                }
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
                  //color: Color.fromRGBO(242, 242, 242, 1),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/BG-NaN 2.jpg'),
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
                        try {
                          var dateLastMessage = message.get("dateAdd");
                          dateLastMessage = DateTime.parse(
                              dateLastMessage.toDate().toString());

                          if (message.get("sender") ==
                              _auth.currentUser.email) {
                            messageList.add(RightMessage(
                                message.data()["message"],
                                dateLastMessage,
                                message.data()["isRead"]));
                            //message.get("lastMessage")["dateAdd"]
                          } else {
                            // Les Message qu'il a récu
                            if (message.get("notifUser")) {
                              print("Notif Me =================");
                              assetsAudioPlayer.open(
                                  Audio("assets/sound/intuition-561.mp3"),
                                  volume: 40.0
                                  //autoPlay: true,
                                  );
                            }
                            _firestore
                                .collection("ChatRoom")
                                .doc(widget.idSalon)
                                .collection("chats")
                                .doc(message.id)
                                .update({"isRead": true});

                            messageList.add(LeftMessage(
                                message.data()["message"],
                                dateLastMessage,
                                message.data()["isRead"]));
                          }
                        } catch (e) {
                          print("Error to fetch Message ${e.toString()}");
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
                  constraints: BoxConstraints(minHeight: 60, maxHeight: 100),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width / 1.3,
                    alignment: Alignment.center,
                    child: TextField(
                      cursorColor: Colors.grey,
                      maxLines: null,
                      controller: messageText,
                      decoration: InputDecoration(
                          hintText: 'Taper votre message',
                          hintStyle:
                              TextStyle(fontFamily: 'Barlow', fontSize: 16),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: primaryColor,
                  ),
                  onPressed: () {
                    if(messageText.text.length > 0){
                          DateTime timeSend = DateTime.now();
                    _firestore
                        .collection("ChatRoom")
                        .doc(widget.idSalon)
                        .collection("chats")
                        .add({
                      "message": messageText.text,
                      "sender": currentUser.email,
                      "dateAdd": timeSend,
                      "isRead": isEnligne,
                      "notifUser": isEnligne ? true : false
                    });
                    _firestore
                        .collection("ChatRoom")
                        .doc(widget.idSalon)
                        .update({
                      "lastMessage": {
                        "dateAdd": timeSend,
                        "message": messageText.text
                      }
                    });
                    messageText.clear();
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
