import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/screens/ChatPages/chatPage.dart';
import 'package:mynan/screens/ChatPages/detailUser.dart';

class ProfilImage extends StatelessWidget {
  String imagePath;
  ProfilImage({this.imagePath});

  @override
  Widget build(BuildContext context) {
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
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profil()));
            }),

        FocusedMenuItem(
            title: Text("Chater"),
            trailingIcon: Icon(
              Icons.chat,
              color: primaryColor,
            ),
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (context) => ChatPage(),
              // )
              // );
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
          
          backgroundImage:imagePath!=null? NetworkImage(imagePath):AssetImage("assets/images/bg-header.jpg"),
          radius: 30,
        ),
      ),
    );
  }
}
