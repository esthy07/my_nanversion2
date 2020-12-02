import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/Provider/UserProv.dart';
import 'package:mynan/Provider/dataBaseMethode.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:mynan/screens/ChatPages/chatPage.dart';
import 'package:provider/provider.dart';

class Profil extends StatefulWidget {
  UserModel user;
  Profil(this.user);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  UserModel currentUser;
  DataBaseMethode dataBaseMethode = DataBaseMethode();
  Future creatNewChatRoom(UserModel curentUser, UserModel otherUser) async {
    try {
      print("Add new chatRoom");
      Map<String, String> user1 = {
        "email": curentUser.email,
        "image": curentUser.image
      };
      Map<String, String> user2 = {
        "email": otherUser.email,
        "image": otherUser.image
      };
      List<Map<String, dynamic>> users = [user1, user2];
      String idSalon = await dataBaseMethode.createChatRoom(users);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => ChatPage(
          idSalon: idSalon,
          image: otherUser.image,
          titre: otherUser.username,
        ),
      ));
    } catch (e) {
      print("ERROR TO ADD NEWS CHATROOM ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    currentUser = Provider.of<UserProv>(context).loggedInUser;

    Widget champ(String text, String text1) {
      return Container(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(20),
        child: Row(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(text, style: TextStyle(color: Colors.grey)),
                SizedBox(height: 10),
                Text(text1,
                    style: TextStyle(color: Colors.black, fontSize: 20)),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: widget.user.image == null
                              ? AssetImage("assets/images/nan.png")
                              : NetworkImage(widget.user.image),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle),
                ),
                Positioned(
                  bottom: 12,
                  right: 15,
                  child: Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: Color(0xff983298),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${widget.user.username}',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.place,
                  color: primaryColor,
                ),
                Text(
                  '${widget.user.address}',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(
                    left: deviceWidth * .05,
                    right: deviceWidth * .05,
                    top: deviceHeight * .02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.edit,
                      color: primaryColor,
                      size: 17,
                    ),
                    Text(
                      'contactez',
                      style: TextStyle(
                          fontFamily: 'Barlow',
                          color: primaryColor,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            if (widget.user.firstname != null)
              champ('Nom', '${widget.user.firstname}'),
            if (widget.user.lastname != null)
              champ('Prenoms', '${widget.user.lastname}'),
            if (widget.user.email != null)
              champ('Adresse email', '${widget.user.email}'),
          ],
        ),
      ),
    );
  }
}
