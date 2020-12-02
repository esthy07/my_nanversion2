import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/Provider/UserProv.dart';
import 'package:mynan/Provider/dataBaseMethode.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:mynan/screens/ChatPages/chatPage.dart';
import 'package:mynan/screens/ChatPages/detailUser.dart';
import 'package:provider/provider.dart';

class ProfilImage extends StatefulWidget {
  UserModel user;

  ProfilImage({this.user});

  @override
  _ProfilImageState createState() => _ProfilImageState();
}

class _ProfilImageState extends State<ProfilImage> {
  DataBaseMethode dataBaseMethode = DataBaseMethode();

  UserModel currentUser;

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
          otherEmail: otherUser.email,
        ),
      ));
    } catch (e) {
      print("ERROR TO ADD NEWS CHATROOM ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    currentUser = Provider.of<UserProv>(context).loggedInUser;
    return FocusedMenuHolder(
      menuWidth: MediaQuery.of(context).size.width * 0.50,
      blurSize: 5.0,
      menuItemExtent: 45,
      menuBoxDecoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      duration: Duration(milliseconds: 100),
      animateMenuItems: true,
      blurBackgroundColor: Colors.black54,
      menuOffset: 10.0, // Offset value to show menuItem from the selected item
      bottomOffsetHeight: 80.0, //
      menuItems: <FocusedMenuItem>[
        // Add Each FocusedMenuItem  for Menu Options
        FocusedMenuItem(
            title: Text("Detail"),
            trailingIcon: Icon(
              Icons.details,
              color: primaryColor,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Profil(widget.user)));
            }),

        FocusedMenuItem(
            title: Text("Chater"),
            trailingIcon: Icon(
              Icons.chat,
              color: primaryColor,
            ),
            onPressed: () {
              creatNewChatRoom(currentUser, widget.user);
            }),
        // FocusedMenuItem(
        //     title: Text("Favorite"),
        //     trailingIcon: Icon(Icons.favorite_border),
        //     onPressed: () {}),
        FocusedMenuItem(
            title: Text(
              "Delete",
              style: TextStyle(color: Colors.redAccent),
            ),
            trailingIcon: Icon(
              Icons.delete,
              color: Colors.redAccent,
            ),
            onPressed: () {}),
      ],
      onPressed: () {},
      child: Container(
        child: CircleAvatar(
          backgroundImage: widget.user.image != null
              ? NetworkImage(widget.user.image)
              : AssetImage("assets/images/bg-header.jpg"),
          radius: 30,
        ),
      ),
    );
  }
}
