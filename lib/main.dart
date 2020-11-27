import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/screens/AuthPages/connexion.dart';
import 'package:mynan/screens/AuthPages/login.dart';
import 'package:mynan/screens/AuthPages/register.dart';
import 'package:mynan/screens/HomePages/home.dart';
import 'package:mynan/screens/HomePages/homePage.dart';
import 'package:mynan/screens/HomePages/profil_adresse.dart';
import 'package:mynan/screens/Notes/note.dart';
import 'package:mynan/screens/Notes/quiz.dart';
import 'package:mynan/test.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'Provider/UserProv.dart';
import 'Provider/UserProv.dart';
import 'Provider/utilisateurProv.dart';
import 'screens/AuthPages/inscription.dart';
import 'screens/HomePages/modif_profil.dart';
import 'screens/homeTest.dart';
import 'screens/modif_user.dart';

// babyboy20
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _auth = FirebaseAuth.instance;
  User user;
  @override
  void initState() {
    getCurentUser();
    super.initState();
  }

  void getCurentUser() async {
    user = _auth.currentUser;
    if (user != null) {
      print("CurentUser ${user.email}");
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Color.fromRGBO(67, 2, 63, 1), //or set color with: Color(0xFF0000FF)
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProv()),
        ChangeNotifierProvider.value(value: UtilisateurProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My NaN ',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        //home: MyHomePage(title: 'Flutter Demo Home Page'),
        initialRoute: user != null? Home.routeName: ConexionPage.routeName,
        routes: {
          HomePage.routeName: (BuildContext context) => HomePage(),
          Home.routeName: (BuildContext context) => Home(),
          Login.routeName: (BuildContext context) => Login(),
          Register.routeName: (BuildContext context) => Register(),
          Revision.routeName: (BuildContext context) => Revision(),
          TestPage.routeName: (BuildContext context) => TestPage(),
          ConexionPage.routeName: (BuildContext context) => ConexionPage(),
          ProfilAdresse.routeName: (BuildContext context) => ProfilAdresse(),
          HomeTest.routeName: (BuildContext context) => HomeTest(),
          ModifUtilisateur.routeName: (BuildContext context) => ModifUtilisateur(),
          ModifProfil.routeName: (BuildContext context) => ModifProfil(),
          InscriptionPage.routeName: (BuildContext context) => InscriptionPage()
        },
      ),
    );
  }
}
