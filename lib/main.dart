import 'package:flutter/material.dart';
import 'package:mynan/screens/home.dart';
import 'package:mynan/screens/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: Home.routeName,
      routes: {
        HomePage.routeName: (BuildContext context) => HomePage(),
        Home.routeName:(BuildContext context) => Home()
      },
    );
  }
}
