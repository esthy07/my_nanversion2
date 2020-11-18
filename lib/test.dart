import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'widgets/drawer.dart';
import 'widgets/parcoursWidget.dart';

class TestPage extends StatefulWidget {

  static const routeName = 'testPage';

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {

  Widget myContainerOne() {
    return Container(
      height: 160,
      width: 250,
      color: Colors.grey,
    );
  }

  Widget myContainerTwo() {
    return Container(
      height: 160,
      width: 250,
      color: Colors.white,
    );
  }

  Widget myContainerThree() {
    return Container(
      height: 160,
      width: 250,
      color: Colors.grey,
    );
  }


   List<Widget> listModule = [
     ParcoursWidget(colorModule:Colors.grey ,),
     ParcoursWidget(),
     ParcoursWidget()


  ];
  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      drawer: DrawerPage(),
      body: Builder(
        builder: (BuildContext context) {
          return Container(
            height: deviceHeight,
            width: deviceWidth,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bbb.jpg'),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.luminosity)
                )
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: deviceWidth * .05),
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
                ),

                Container(
                  margin: EdgeInsets.only(top: deviceHeight * .2),
                  child: CarouselSlider(
                      items: listModule,
                      options: CarouselOptions(
                          viewportFraction: 0.75,
                        autoPlay: false,
                        aspectRatio: 1.8,
                        enlargeCenterPage: false
                      )
                  ),
                )
              ],
            ),
          );
        },
      )
    );
  }
}
