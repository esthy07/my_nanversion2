import 'package:flutter/material.dart';
import 'package:mynan/screens/AuthPages/login.dart';
import 'package:mynan/screens/HomePages/home.dart';
import 'package:mynan/screens/HomePages/homePage.dart';
import 'package:provider/provider.dart';

import 'Provider/UserProv.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        ChangeNotifierProvider.value(
          value: UserProv())
      ] ,
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My NaN ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: MyHomePage(title: 'Flutter Demo Home Page'),
        initialRoute: Login.routeName,
        routes: {
          HomePage.routeName: (BuildContext context) => HomePage(),
          Home.routeName:(BuildContext context) => Home(),
          Login.routeName:(BuildContext context) => Login(),
        },
      ),
    );
  }
}
