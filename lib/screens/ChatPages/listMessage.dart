import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynan/Provider/UserProv.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:mynan/screens/ChatPages/chatPage.dart';
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
                  print(salon.data());
                  if (salon.data()["sender"] == _auth.currentUser.email ||
                      salon.data()["for"] == _auth.currentUser.email)
                    listSalon.add(detailListMessage(
                        context: context,
                        heure: "12:21",
                        image:
                            "https://cdn.pixabay.com/photo/2020/09/27/04/15/cat-5605615__340.jpg",
                        message: "ok merci",
                        nom: "My Salon",
                        collBack: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ChatPage(UserModel(email: "patrick@gmail")),
                            ))));

                  return ListView(
                    // reverse: true,
                    children: listSalon,
                  );
                }
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

// Container(
//   child: !_init
//       ? ListView.builder(
//           itemCount: allUser?.length,
//           itemBuilder: (context, index) {
//             if (allUser[index].email != _auth.currentUser.email) {
//               return detailListMessage(
//                   context: context,
//                   heure: "12:00",
//                   image: allUser[index].image,
//                   message: "Ok c'est compris",
//                   nom: allUser[index].email,
//                   collBack: () =>
//                       Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => ChatPage(allUser[index]),
//                       )));
//             }
//             return null;
//           },
//         )
//       : Container(
//           child: Center(
//             child: Text("Loading ..."),
//           ),
//         ),
// ),
//
