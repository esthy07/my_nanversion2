
import 'package:flutter/material.dart';
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
      body: Container(
        height: deviceHeight,
        width: deviceHeight,
        decoration: BoxDecoration(
          //color: Colors.pink,
            image: DecorationImage(
                image: AssetImage('assets/images/bbb.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: Padding(
          padding: EdgeInsets.only(left: deviceWidth * .05, right: deviceWidth * .03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(top: deviceHeight * .1,),
                  child: Text('Bienvenue sur MyNaN', style: TextStyle(
                      color: Colors.white, fontSize: 25
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
                      height: deviceHeight * .17,
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
                                      color: Colors.purple, fontWeight: FontWeight.w500, fontSize: 20
                                  ),),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: deviceWidth * .05),
                      margin: EdgeInsets.only(top: deviceHeight * .02),
                      height: deviceHeight * .17,
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
                                  child: Text('Status', style: TextStyle(
                                      color: Colors.purple, fontWeight: FontWeight.w500, fontSize: 20
                                  ),),
                                ),
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
