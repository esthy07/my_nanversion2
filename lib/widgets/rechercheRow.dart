import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/Provider/UserProv.dart';
import 'package:mynan/Provider/dataBaseMethode.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:mynan/screens/ChatPages/chatPage.dart';
import 'package:mynan/screens/ChatPages/detailUser.dart';
import 'package:mynan/widgets/profilImage.dart';
import 'package:provider/provider.dart';

class RecherchRow extends StatefulWidget {
  List<Map<String, dynamic>> userDistanceList;

  RecherchRow(this.userDistanceList);

  @override
  _RecherchRowState createState() => _RecherchRowState();
}

class _RecherchRowState extends State<RecherchRow> {
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
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final rowHeight = deviceHeight * .25;
    return widget.userDistanceList.isNotEmpty
        ? Container(
            height: rowHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  child: ProfilImage(user: widget.userDistanceList[0]["user"]),
                ),
                if (widget.userDistanceList.length > 2)
                  Container(
                    margin: EdgeInsets.only(bottom: rowHeight * .35),
                    child:
                        ProfilImage(user: widget.userDistanceList[2]["user"]),
                  ),
                if (widget.userDistanceList.length > 1)
                  Container(
                    child:
                        ProfilImage(user: widget.userDistanceList[1]["user"]),
                  )
              ],
            ),
          )
        : Container();
  }
}
