import 'package:flutter/material.dart';

class Profil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                IconButton(icon: Icon(Icons.arrow_back), onPressed: () {}),
                IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage("images/will.jpg")),
                      color: Color(0xff983298),
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
                  'Will Smith',
                  style: TextStyle(color: Colors.black, fontSize: 30),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Developpeur',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 20),
            champ('Nom', 'Yapi'),
            champ('Prenoms', 'yapo'),
            champ('Adresse email', 'yapiyapo@flutter.org'),
            champ('Specialité', 'Flutter'),
          ],
        ),
      ),
    );
  }
}
