import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynan/screens/AuthPages/connexion.dart';
import 'package:mynan/screens/AuthPages/login.dart';
import 'package:mynan/screens/Notes/note.dart';
import 'package:mynan/screens/Notes/quiz.dart';
import 'package:mynan/test.dart';
import 'package:mynan/widgets/drawer.dart';
import 'package:mynan/widgets/parcoursWidget.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'homePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _auth = FirebaseAuth.instance;

  List<Widget> listModule = [
    ParcoursWidget(
      colorParcours: Colors.grey,
      colorModule: Colors.black,
      nomModule: 'Vue js',
      colorNomParcours: Colors.black,
      colorPourcentage: Colors.black,
    ),
    ParcoursWidget(
      colorParcours: Colors.white,
      colorModule: Colors.blue,
      nomModule: 'React Native',
      colorPourcentage: Colors.green,
      colorNomParcours: Color.fromRGBO(67, 2, 63, 1),
    ),
    ParcoursWidget(
      colorParcours: Colors.grey,
      colorModule: Colors.black,
      nomModule: 'Ionic',
      colorNomParcours: Colors.black,
      colorPourcentage: Colors.black,
    )
  ];

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(67, 2, 63, 1),
        title: Text('myNaN', style: TextStyle(
          color: Colors.white, fontFamily: 'Barlow', fontSize: 20
        ),),
        centerTitle: true,
      ),
      drawer: DrawerPage(),

        body: Builder(
          builder: (BuildContext context) {
            return Container(
              height: deviceHeight,
              width: deviceHeight,
              decoration: BoxDecoration(
                //color: Colors.pink,
                  image: DecorationImage(
                      image: AssetImage('assets/images/esthy.jpg'),
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.7), BlendMode.luminosity),
                      fit: BoxFit.cover)),
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
                          child: Padding(
                            padding: EdgeInsets.only(left: deviceWidth * .03,
                                right: deviceWidth * .03),
                            child: Container(
                              height: deviceHeight * .05,
                              width: deviceWidth * .1,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(67, 2, 63, 0.3),
                                  borderRadius: BorderRadius.circular(5)
                              ),
                              margin: EdgeInsets.only(top: deviceHeight * .07,),
                              child: Icon(
                                Icons.menu, color: Colors.white, size: 27,),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),*/
                  Padding(
                    padding: EdgeInsets.only(
                        left: deviceWidth * .03, right: deviceWidth * .03),
                    child: Container(
                        margin: EdgeInsets.only(
                          top: deviceHeight * .05,
                        ),
                        child: Text(
                          'Bienvenue sur MyNaN',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Barlow'),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: deviceWidth * .03, right: deviceWidth * .03),
                    child: Container(
                      margin: EdgeInsets.only(top: deviceHeight * .015),
                      child: Text('Vendredi 20 novembre', style: TextStyle(
                          color: Colors.white, fontFamily: 'Barlow'
                      ),),
                    ),),
                  Container(
                      margin: EdgeInsets.only(top: deviceHeight * .12),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                left: deviceWidth * .03,
                                right: deviceWidth * .03),
                            child: Container(
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
                                    margin:
                                    EdgeInsets.only(top: deviceHeight * .02),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.school,
                                          color: Color.fromRGBO(67, 2, 63, 1),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: deviceWidth * .02),
                                          child: Text(
                                            'Mon Parcours',
                                            style: TextStyle(
                                                color:
                                                Color.fromRGBO(67, 2, 63, 1),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 20,
                                                fontFamily: 'Barlow'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin:
                                    EdgeInsets.only(top: deviceHeight * .02),
                                    //alignment: Alignment.center,
                                    child: Text(
                                      'JavaScript',
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Barlow'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: deviceHeight * .01),
                            child: CarouselSlider(
                                items: listModule,
                                options: CarouselOptions(
                                    viewportFraction: 0.75,
                                    autoPlay: false,
                                    aspectRatio: 1.8,
                                    enlargeCenterPage: true
                                )
                            ),
                          )
                        ],
                      )

                  )
                ],
              ),
            );
          }),
            );

  }
}
