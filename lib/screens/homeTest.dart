import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/Provider/utilisateurProv.dart';
import 'package:mynan/screens/modif_user.dart';
import 'package:provider/provider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';



class HomeTest extends StatefulWidget {

  static const routeName = 'homeTest';

  @override
  _HomeTestState createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {

  final assetsAudioPlayer = AssetsAudioPlayer();

  final _auth = FirebaseAuth.instance;

  User user;


  @override
  Widget build(BuildContext context) {

    final currentUser = Provider.of<UtilisateurProvider>(context).loggedInUser;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('HomePage'),
      ),
      body: Center(
        child:  Card(
          child: Container(
            padding: EdgeInsets.only(left: 10),
            height: 250,
            width: 320,
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    //margin: EdgeInsets.only(top: deviceHeight * .02),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.school, color: primaryColor),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Text('Information Utilisateurs', style: TextStyle(
                              color: primaryColor, fontWeight: FontWeight.w500, fontSize: 20, fontFamily: 'Barlow'
                          ),),
                        ),
                      ],
                    ),
                  ),
                ),

               FlatButton(
                   onPressed: () {
                     assetsAudioPlayer.open(
                       Audio("assets/sound/intuition-561.mp3"),
                       volume: 40.0
                       //autoPlay: true,
                     );
                    //  AssetsAudioPlayer.newPlayer().open(
                    //    Audio("assets/audios/song1.mp3"),
                    //    showNotification: true,
                    //  );
                   },
                   child: Center(
                     child: Text('jouer', style: TextStyle(
                       color: Colors.black, fontSize: 20, fontFamily: 'Barlow'
                     ),),
                   )
               ),
               /* StreamBuilder(
                    stream: assetsAudioPlayer.volume,
                    builder: (context, asyncSnapshot) {
                      final double volume = asyncSnapshot.data;
                      return Text("volume : $volume");
                    }),*/
               /* Container(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text('Nom: ', style: TextStyle(
                                color: Colors.black54, fontSize: 17, fontFamily: 'Barlow'
                            ),),
                            SizedBox(width: 10,),
                            Text("${currentUser.nom}", style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'Barlow',
                            ),)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            Text('Prenoms: ', style: TextStyle(
                                color: Colors.black54, fontSize: 17, fontFamily: 'Barlow'
                            ),),
                            SizedBox(width: 10,),
                            Text('juujujj', style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500, fontFamily: 'Barlow'
                            ),)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            Text('Commune:', style: TextStyle(
                                color: Colors.black54, fontSize: 17, fontFamily: 'Barlow'
                            ),),
                            SizedBox(width: 10,),
                            Text('hhhhh', style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500, fontFamily: 'Barlow'
                            ),)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10,),
                        child: Row(
                          children: <Widget>[
                            Text('Parcours:', style: TextStyle(
                                color: Colors.black54, fontSize: 17, fontFamily: 'barlow'
                            ),),
                            SizedBox(width: 10,),
                            Text('jjjjj', style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500, fontFamily: 'Barlow'
                            ),)
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: Row(
                          children: <Widget>[
                            Text('Email:', style: TextStyle(
                                color: Colors.black54, fontSize: 17, fontFamily: 'barlow'
                            ),),
                            SizedBox(width: 10,),
                            Text('${_auth.currentUser.email}', style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500, fontFamily: 'Barlow'
                            ),)
                          ],
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                //builder: (_) => ModifAricle(article: articleDetails,)
                                builder: (_) => ModifUtilisateur(),
                              ));
                              print('ca marche ohh');
                            },
                            child: Text('Modifier', style: TextStyle(
                                color: Colors.green, fontSize: 16, fontWeight: FontWeight.bold
                            ),)
                        ),
                      ),
                      // SizedBox(height: deviceHeight * .02,)
                    ],
                  ),
                )*/
              ],
            ),
          ),
        )
      ),
    );
  }
}
