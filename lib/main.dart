import 'package:flutter/material.dart';
import 'package:mynan/screens/AuthPages/login.dart';
import 'package:mynan/screens/HomePages/home.dart';
import 'package:mynan/screens/HomePages/homePage.dart';
import 'package:mynan/screens/Notes/note.dart';
import 'package:mynan/screens/Notes/quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.purple, //or set color with: Color(0xFF0000FF)
    ));*/
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false ,
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: Login.routeName,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        Home.routeName:(BuildContext context) => Home(),
        Login.routeName:(BuildContext context) => Login(),
        Quiz.routeName:(BuildContext context) => Quiz(),
        Revision.routeName:(BuildContext context) => Revision()
      },
    );
  }
}
