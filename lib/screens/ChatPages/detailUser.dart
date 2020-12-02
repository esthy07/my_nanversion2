import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/model/UseurModel.dart';

class Profil extends StatelessWidget {
  UserModel user;
  Profil(this.user);
  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

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
                          image: user.image == null
                              ? AssetImage("assets/images/nan.png")
                              : NetworkImage(user.image),
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
                  '${user.username}',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.place,color: primaryColor,),
                Text(
                  '${user.address}',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            InkWell(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(left: deviceWidth * .05, right: deviceWidth * .05, top: deviceHeight * .02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(Icons.edit, color: primaryColor, size: 17,),
                    Text('contactez', style: TextStyle(
                      fontFamily: 'Barlow', color: primaryColor, fontSize: 17, fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            if(user.firstname != null) champ('Nom', '${user.firstname}'),
            if(user.lastname != null) champ('Prenoms', '${user.lastname}'),
            if(user.email != null) champ('Adresse email', '${user.email}'),
            /*Container(
              height: deviceHeight * .06,
              width: deviceWidth / 2,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(16, 24, 43, 1),
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Center(child: Text('Envoyer message', style: TextStyle(
                color: Colors.white, fontFamily: 'Barlow'
              ),)),
            )*/
            // champ('Specialité', 'Flutter'),
          ],
        ),
      ),
    );
  }
}
