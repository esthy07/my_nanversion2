import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynan/Provider/UserProv.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:mynan/screens/ChatPages/contacts.dart';
import 'package:mynan/screens/ChatPages/detailListMessage.dart';
import 'package:mynan/widgets/drawer.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:provider/provider.dart';
import '../../Constantes/customeTheme.dart';

class ListMessage extends StatefulWidget {
  @override
  _ListMessageState createState() => _ListMessageState();
}

class _ListMessageState extends State<ListMessage> {
  bool _init = true;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_init) {
      await Provider.of<UserProv>(context, listen: false).getAllUser();
      setState(() {
        _init = false;
      });
    }
  }

  List<UserModel> allUser = [];

  final _firestore = FirebaseFirestore.instance;

  final dbRef = FirebaseDatabase.instance.reference().child("UserModel");
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    allUser = Provider.of<UserProv>(context).allUsers;
    return Scaffold(
      floatingActionButton: CircleAvatar(
        backgroundColor: primaryColor,
        radius: 25,
        child: IconButton(
          icon: Icon(Icons.chat,color: Colors.white,),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactPage(),)),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(
          'myNaN',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Barlow', fontSize: 20),
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
      drawer: DrawerPage(),
      body: Container(
          height: MediaQuery.of(context).size.height - 100,
          child: StreamBuilder<QuerySnapshot>(
            stream: _firestore.collection("salons").snapshots(),
            builder: (context, snapshot) {
              List<Widget> listSalon = [];
              if (snapshot.hasData) {
                final salons = snapshot.data.docs.reversed;

                for (var salon in salons) {
                  print("############################");
                  print(salon.get("sender")["email"]);
                  var dateLastMessage =
                      salon.get("lastMessage")["dateMessages"];
                  dateLastMessage =
                      DateTime.parse(dateLastMessage.toDate().toString());
                  final senderEmail = salon.get("sender")["email"];
                  final senderImage = salon.get("sender")["image"];
                  final forEmail = salon.get("for")["email"];
                  final forImage = salon.get("for")["image"];
                  final lastMessage = salon.get("lastMessage");
                  final idSalon = salon.id;
                  final curentEmail = _auth.currentUser.email;
                  String imageSalon = "";
                  String titreSalon = "";

                  if (senderEmail == curentEmail || forEmail == curentEmail) {
                    if (curentEmail == senderEmail) {
                      imageSalon = forImage;
                      titreSalon = forEmail;
                    } else {
                      imageSalon = senderImage;
                      titreSalon = senderEmail;
                    }
                    listSalon.add(detailListMessage(
                      context: context,
                      heure: dateLastMessage,
                      idSalon: idSalon,
                      image: imageSalon,
                      lastMessage: lastMessage,
                      titre: titreSalon,
                    ));
                  }
                }
                return ListView(
                  // reverse: true,
                  children: listSalon,
                );
              } else {
                return Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          )),
    );
  }
}

