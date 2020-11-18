
import 'package:flutter/material.dart';
import 'package:mynan/screens/AuthPages/login.dart';
import 'package:mynan/screens/Notes/note.dart';
import 'package:mynan/screens/Notes/quiz.dart';
import 'package:mynan/widgets/drawer.dart';
class HomePage extends StatefulWidget {

  static const routeName = 'homePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('myNaN', style: TextStyle(
          color: Colors.white, fontFamily: 'Barlow', fontSize: 20
        ),),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            /*DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/images/jeune.jpg'),
                              fit: BoxFit.cover
                            )
                          ),
                        ),
                        SizedBox(width: deviceWidth * .02,),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Esthy07', style: TextStyle(
                                fontWeight: FontWeight.bold, fontFamily: 'Barlow', fontSize: 18
                              ),),
                              SizedBox(height: deviceHeight * .01,),
                              Text('esthythy@nan.ci', style: TextStyle(
                                color: Colors.grey, fontFamily: 'Barlow', fontSize: 16
                              ),)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: deviceHeight * .05),
                    child: Text('NaN4.21_AT0131', style: TextStyle(
                      color: Colors.purple, fontFamily: 'Barlow', fontWeight: FontWeight.bold
                    ),),
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),*/
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
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('assets/images/jeune.jpg'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          SizedBox(width: deviceWidth * .02,),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Esthy N'goran", style: TextStyle(
                                    fontWeight: FontWeight.bold, fontFamily: 'Barlow', fontSize: 22
                                ),),
                                SizedBox(height: deviceHeight * .01,),
                                Text('esthythy@nan.ci', style: TextStyle(
                                    color: Colors.grey, fontFamily: 'Barlow', fontSize: 16
                                ),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: deviceHeight * .05),
                      child: Text('NaN4.21_AT0131', style: TextStyle(
                          color: Colors.purple, fontFamily: 'Barlow', fontWeight: FontWeight.bold, fontSize: 16
                      ),),
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
                        width: deviceWidth / 1.5,
                        decoration: BoxDecoration(
                          //color: Colors.purple,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.purple, width: 1)
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.book, color: Colors.grey, size: 20,),
                            SizedBox(width: deviceWidth * .02,),
                            Text('Mes Notes', style: TextStyle(
                              fontFamily: 'Barlow', fontWeight: FontWeight.w600, fontSize: 18
                            ),)
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Login.routeName);
                      },
                      child: Container(
                        padding: EdgeInsets.only(left: deviceWidth * .02,),
                        height: deviceHeight * .06,
                        width: deviceWidth / 1.5,
                        margin: EdgeInsets.only(top: deviceHeight * .05),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.purple, width: 1)
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.save_alt, color: Colors.grey, size: 20,),
                            SizedBox(width: deviceWidth * .02,),
                            Text('Deconnexion', style: TextStyle(
                                fontFamily: 'Barlow', fontWeight: FontWeight.w600, fontSize: 18
                            ),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            )
          ],
        ),
      ),
      //drawer: DrawerPage(),
      body: Container(
        height: deviceHeight,
        width: deviceHeight,
        decoration: BoxDecoration(
          //color: Colors.pink,
            image: DecorationImage(
                image: AssetImage('assets/images/esthy.jpg'),
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.luminosity),
                fit: BoxFit.cover
            )
        ),
        child: Padding(
          padding: EdgeInsets.only(left: deviceWidth * .05, right: deviceWidth * .03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /*Container(
                child: Row(
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        print('thythy');
                        Scaffold.of(context).openDrawer();
                      },
                      child: Container(
                        height: deviceHeight * .05,
                        width: deviceWidth * .1,
                        decoration: BoxDecoration(
                          color: Colors.purple.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(5)
                        ),
                        margin: EdgeInsets.only(top: deviceHeight * .05,),
                        child: Icon(Icons.menu, color: Colors.white, size: 27,),
                      ),
                    )
                  ],
                ),
              ),*/
              Container(
                  margin: EdgeInsets.only(top: deviceHeight * .05,),
                  child: Text('Bienvenue sur MyNaN', style: TextStyle(
                      color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Barlow'
                  ),)
              ),
              Container(
                margin: EdgeInsets.only(top: deviceHeight * .015),
                child: Text('Vendredi 20 novembre', style: TextStyle(
                    color: Colors.white
                ),),
              ),
              Container(
                margin: EdgeInsets.only(top: deviceHeight * .15),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: deviceWidth * .05),
                      height: deviceHeight * .15,
                      width: deviceWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: deviceHeight * .02),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.school, color: Colors.purple,),
                                Container(
                                  margin: EdgeInsets.only(left: deviceWidth * .02),
                                  child: Text('Mon Parcours', style: TextStyle(
                                      color: Colors.purple, fontWeight: FontWeight.w500, fontSize: 20, fontFamily: 'Barlow'
                                  ),),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: deviceHeight * .02),
                            //alignment: Alignment.center,
                            child: Text('JavaScript', style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold
                            ),),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: deviceWidth * .05),
                      margin: EdgeInsets.only(top: deviceHeight * .02),
                      height: deviceHeight * .2,
                      width: deviceWidth,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)
                      ),
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: deviceHeight * .02),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.school, color: Colors.purple,),
                                Container(
                                  margin: EdgeInsets.only(left: deviceWidth * .02),
                                  child: Text('Information Pacours', style: TextStyle(
                                      color: Colors.purple, fontWeight: FontWeight.w500, fontSize: 20, fontFamily: 'Barlow'
                                  ),),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: deviceHeight * .02),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Text('Status:', style: TextStyle(
                                        color: Colors.black54, fontSize: 17, fontFamily: 'Barlow'
                                      ),),
                                      SizedBox(width: deviceWidth * .02,),
                                      Text('Pas valider', style: TextStyle(
                                          fontSize: 17, fontWeight: FontWeight.w500
                                      ),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: deviceHeight * .01),
                                  child: Row(
                                    children: <Widget>[
                                      Text('Progression:', style: TextStyle(
                                          color: Colors.black54, fontSize: 17, fontFamily: 'Barlow'
                                      ),),
                                      SizedBox(width: deviceWidth * .02,),
                                      Text('En cours', style: TextStyle(
                                        fontSize: 17, fontWeight: FontWeight.w500
                                      ),)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: deviceHeight * .01),
                                  child: Row(
                                    children: <Widget>[
                                      Text('Pourcentage:', style: TextStyle(
                                          color: Colors.black54, fontSize: 17, fontFamily: 'barlow'
                                      ),),
                                      SizedBox(width: deviceWidth * .02,),
                                      Text('75%', style: TextStyle(
                                          fontSize: 17, fontWeight: FontWeight.w500, color: Colors.green
                                      ),)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
