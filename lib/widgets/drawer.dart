import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynan/screens/AuthPages/connexion.dart';
import 'package:mynan/screens/AuthPages/login.dart';
import 'package:mynan/screens/Notes/note.dart';

import '../test.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: deviceWidth / 1.5,
      color: Colors.white,
      child: Drawer(
        child: ListView(
          children: <Widget>[
            Container(
              height: deviceHeight / 3.5,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: deviceWidth * .05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: deviceHeight * .05),
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/jeune.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            width: deviceWidth * .02,
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Esthy N'goran",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Barlow',
                                      fontSize: 18),
                                ),
                                //SizedBox(height: deviceHeight * .01,),
                                Text(
                                  'esthythy@nan.ci',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'Barlow',
                                      fontSize: 15),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: deviceHeight * .05),
                      child: Text(
                        'NaN4.21_AT0131',
                        style: TextStyle(
                            color: Colors.purple,
                            fontFamily: 'Barlow',
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: deviceHeight * .05),
                child: Padding(
                  padding: EdgeInsets.only(left: deviceWidth * .05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Revision.routeName);
                        },
                        child: Container(
                          padding: EdgeInsets.only(left: deviceWidth * .02),
                          margin: EdgeInsets.only(top: deviceHeight * .02),
                          height: deviceHeight * .06,
                          width: deviceWidth / 1.9,
                          decoration: BoxDecoration(
                              //color: Colors.purple,
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.purple, width: 1)),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.book,
                                color: Colors.grey,
                                size: 20,
                              ),
                              SizedBox(
                                width: deviceWidth * .02,
                              ),
                              Text(
                                'Mes Notes',
                                style: TextStyle(
                                    fontFamily: 'Barlow',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _auth.signOut();
                          Navigator.pushNamed(context, TestPage.routeName);
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            left: deviceWidth * .02,
                          ),
                          height: deviceHeight * .06,
                          width: deviceWidth / 1.9,
                          margin: EdgeInsets.only(top: deviceHeight * .05),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.purple, width: 1)),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.save_alt,
                                color: Colors.grey,
                                size: 20,
                              ),
                              SizedBox(
                                width: deviceWidth * .02,
                              ),
                              Text(
                                'Deconnexion',
                                style: TextStyle(
                                    fontFamily: 'Barlow',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
