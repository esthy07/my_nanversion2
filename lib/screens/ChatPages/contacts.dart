import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/Provider/UserProv.dart';
import 'package:mynan/Provider/dataBaseMethode.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:mynan/screens/ChatPages/chatPage.dart';
import 'package:mynan/widgets/chatWidget/contactContainer.dart';
import 'package:mynan/widgets/drawer.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatefulWidget {
  ContactPage({Key key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool _init = true;
  DataBaseMethode dataBaseMethode = DataBaseMethode();
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

  Future creatNewChatRoom(UserModel curentUser, UserModel otherUser) async {
    try {
      print("Add new chatRoom");
      Map<String, String> user1 = {
        "email": curentUser?.email,
        "image": curentUser.image
      };
      Map<String, String> user2 = {
        "email": otherUser?.email,
        "image": otherUser.image
      };
      List<Map<String, dynamic>> users = [user1, user2];
      String idSalon = await dataBaseMethode.createChatRoom(users);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ChatPage(idSalon: idSalon,image: otherUser.image,titre: otherUser.username,otherEmail: otherUser?.email,),
      ));
    } catch (e) {
      print("ERROR TO ADD NEWS CHATROOM ${e.toString()}");
    }
  }

  final _auth = FirebaseAuth.instance;
  List<UserModel> allUser = [];
  UserModel currentUser;
  @override
  Widget build(BuildContext context) {
    allUser = Provider.of<UserProv>(context).allUsers;
    currentUser = Provider.of<UserProv>(context).loggedInUser;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(
          'MyNaN Contact',
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
      body: Container(
        child: !_init
            ? ListView.builder(
                itemCount: allUser?.length,
                itemBuilder: (context, index) {
                  if (allUser[index]?.email != _auth.currentUser.email) {
                    return ContactContainer(allUser[index],
                        () => creatNewChatRoom(currentUser, allUser[index]));
                  }
                  return Container();
                },
              )
            : Container(
                child: Center(
                  child: Text("Loading ..."),
                ),
              ),
      ),
    );
    ;
  }
}
