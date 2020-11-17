
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.purple,),
              title: Text('Rechercher', style: TextStyle(
                fontWeight: FontWeight.w300
              ),)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.mail, color: Colors.purple,),
                title: Text('Message', style: TextStyle(
                    fontWeight: FontWeight.w300
                ),)
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, color: Colors.purple,),
                title: Text('Profils', style: TextStyle(
                    fontWeight: FontWeight.w300
                ),)
            )
          ]
      ),
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
                child: Text('Bienvenue sur MyNaN')
                /*TypewriterAnimatedTextKit(
                    speed: Duration(seconds: 2),
                    text: ['Bienvenue sur MyNaN'],
                    textStyle : TextStyle(
                        color: Colors.black, fontSize: 35, fontFamily: "Agne"
                    ),  textAlign: TextAlign.start,
                    alignment: AlignmentDirectional.topStart )*/
              ),
              Container(
                margin: EdgeInsets.only(top: deviceHeight * .015),
                child: Text('Vendredi 20 novembre', style: TextStyle(
                  color: Colors.white
                ),),
              ),
              Container(
                padding: EdgeInsets.only(left: deviceWidth * .05),
                margin: EdgeInsets.only(top: deviceHeight * .08),
                height: deviceHeight * .2,
                width: deviceWidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: deviceHeight * .08),
                      child: Text('Mon Parcours', style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20
                      ),),
                    )
                  ],
                ),
              ),
              Container(
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
                      child: Text('Mon Parcours', style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 20
                      ),),
                    )
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
