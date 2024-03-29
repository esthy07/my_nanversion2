import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geodesy/geodesy.dart';
import 'package:mynan/Provider/UserProv.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:mynan/model/salonModel.dart';
import 'package:mynan/screens/ChatPages/contacts.dart';
import 'package:mynan/screens/ChatPages/salonContainer.dart';
import 'package:mynan/widgets/drawer.dart';
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

  UserModel currentUser;
  List<UserModel> allUser = [];

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    allUser = Provider.of<UserProv>(context).allUsers;
    currentUser = Provider.of<UserProv>(context).loggedInUser;
    Map<String, String> user1 = {
      "image": currentUser.image,
      "email": currentUser.email,
    };
    return Scaffold(
      floatingActionButton: CircleAvatar(
        backgroundColor: primaryColor,
        radius: 25,
        child: IconButton(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ContactPage(),
          )),
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
            stream: _firestore
                .collection("ChatRoom")
                .where("users", arrayContains: user1)
                .snapshots(),
            builder: (context, snapshot) {
              List<Salon> modelSalons = [];
              List<Widget> listSalon = [];
              if (snapshot.hasData) {
                final salons = snapshot.data.docs.reversed;

                for (var salon in salons) {
                  var dateLastMessage = salon.get("lastMessage")["dateAdd"];

                  dateLastMessage =
                      DateTime.parse(dateLastMessage.toDate().toString());
                  Salon newSalonModel = Salon.fromMap(salon.data());
                  modelSalons.add(newSalonModel);
                }
                modelSalons.sort(
                    (a, b) => a.dateLastMessage.compareTo(b.dateLastMessage));
                modelSalons.reversed;

                for (Salon s in modelSalons) {
                  String image = "";
                  String titre = "";
                  final user1 = s.users[0];
                  final user2 = s.users[1];
                  if (_auth.currentUser.email == user1.email) {
                    titre = user2.email;
                    image = user2.image;
                  } else {
                    titre = user1.email;
                    image = user1.image;
                  }
                  listSalon.add(SalonContainer(
                      heure: s.dateLastMessage,
                      idSalon: s.chatRoomId,
                      image: image,
                      lastMessage: s.lastMessage.message,
                      titre: titre));
                }
              listSalon = listSalon.reversed.toList();
                // listSalon.sort((a, b) => a.heure.compareTo(b.heure));
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
