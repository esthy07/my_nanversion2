import 'package:flutter/material.dart';
import 'package:mynan/screens/AuthPages/connexion.dart';
import 'package:mynan/screens/AuthPages/login.dart';
import 'package:mynan/screens/AuthPages/register.dart';
import 'package:mynan/screens/HomePages/home.dart';
import 'package:mynan/screens/HomePages/homePage.dart';
import 'package:mynan/screens/Notes/note.dart';
import 'package:mynan/screens/Notes/quiz.dart';
import 'package:mynan/test.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'Provider/UserProv.dart';

// babyboy20
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:  Color.fromRGBO(67, 2, 63, 1), //or set color with: Color(0xFF0000FF)
    ));
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: UserProv())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My NaN ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: MyHomePage(title: 'Flutter Demo Home Page'),
        initialRoute: ConexionPage.routeName,
        routes: {
          HomePage.routeName: (BuildContext context) => HomePage(),
          Home.routeName: (BuildContext context) => Home(),
          Login.routeName: (BuildContext context) => Login(),
          Register.routeName: (BuildContext context) => Register(),
          Revision.routeName: (BuildContext context) => Revision(),
          TestPage.routeName: (BuildContext context) => TestPage(),
          ConexionPage.routeName: (BuildContext context) => ConexionPage()
        },
      ),
    );
  }
}
