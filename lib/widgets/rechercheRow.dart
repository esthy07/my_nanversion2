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
  UserModel currentUser ;
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
                  FocusedMenuHolder(
                    menuWidth: MediaQuery.of(context).size.width * 0.50,
                    blurSize: 5.0,
                    menuItemExtent: 45,
                    menuBoxDecoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(15.0))),
                    duration: Duration(milliseconds: 100),
                    animateMenuItems: true,
                    blurBackgroundColor: Colors.black54,
                    menuOffset:
                        10.0, // Offset value to show menuItem from the selected item
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Profil(
                                        widget.userDistanceList[2]["user"])));
                          }),

                      FocusedMenuItem(
                          title: Text("Chater"),
                          trailingIcon: Icon(
                            Icons.chat,
                            color: primaryColor,
                          ),
                          onPressed: () {
                            String idSalon = dataBaseMethode.generatChatId(currentUser.email,widget.userDistanceList[2]["user"].email);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ChatPage(
                                idSalon: idSalon,
                                image: widget.userDistanceList[2]["user"].image,
                                titre: widget.userDistanceList[2]["user"].email,
                              ),
                            ));
                          }),

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
                      margin: EdgeInsets.only(bottom: rowHeight * .35),
                      child:
                          ProfilImage(user: widget.userDistanceList[2]["user"]),
                    ),
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
