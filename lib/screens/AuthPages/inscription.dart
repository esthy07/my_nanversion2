import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/Provider/UserProv.dart';
import 'package:mynan/Provider/localPlaceMethode.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:mynan/screens/HomePages/home.dart';
import 'package:provider/provider.dart';

import 'connexion.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

class InscriptionPage extends StatefulWidget {
  static const routeName = 'inscription';

  @override
  _InscriptionPageState createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final _formKey = GlobalKey<FormState>();

  String email;
  String passeword;
  String numerotControleur;
  final _auth = FirebaseAuth.instance;
  LocalPlaceMethode localPlaceMethode = LocalPlaceMethode();

  Random _rnd = Random();
  bool loader = false;

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future<void> seveUser() async {
    bool isOk = _formKey.currentState.validate();
    final String userName = "NaN4.21_" + getRandomString(4);
    if (isOk) {
      setState(() {
        loader = true;
      });
      try {
        final newUser = await _auth.createUserWithEmailAndPassword(
            email: email, password: passeword);
        if (newUser != null) {
          Map<String, dynamic> mapPlace =
              await localPlaceMethode.getCurrentLocation();
          var rng = new Random();
          UserModel newUserProv = UserModel(
              email: newUser.user.email,
              image:
                  userDefaultImageUrl[rng.nextInt(userDefaultImageUrl.length)],
              username: userName,
              ville: "Abidjan",
              address: mapPlace["address"],
              place: mapPlace["place"]);
          setState(() {
            loader = false;
          });
          Provider.of<UserProv>(context, listen: false).addUser(newUserProv); 
          Navigator.of(context).pushNamed(Home.routeName);
        }
      } catch (e) {
        setState(() {
          loader = false;
        });
        print("Error ${e.toString()}");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    EdgeInsets inputMargin = EdgeInsets.only(
        top: deviceHeight * .01,
        left: deviceWidth * .04,
        right: deviceWidth * .04);
    BoxDecoration inputDecoration = BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color(0x1a000000),
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 5))
        ],
        color: Color.fromRGBO(242, 242, 242, 1),
        borderRadius: BorderRadius.circular(5));

    return Scaffold(
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/421flutter2.jpg'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.only(
              left: deviceWidth * .03, right: deviceWidth * .05),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: deviceHeight * .4,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: deviceWidth * .04),
                          child: Text(
                            "Email ou Nom d'utilisateur",
                            style: TextStyle(
                                fontFamily: 'Barlow',
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: inputMargin,
                          height: deviceHeight * .07,
                          width: deviceWidth,
                          decoration: inputDecoration,
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "veillez remplire le champ ";
                              } else {
                                email = value;
                              }
                              return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                                focusColor: Colors.purple,
                                prefixIcon: Icon(
                                  Icons.email,
                                  size: 20,
                                ),
                                border: InputBorder.none,
                                hintText: 'esthythy@nan.ci',
                                hintStyle: TextStyle(fontFamily: 'barlow')),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: deviceHeight * .035,
                              left: deviceWidth * .04),
                          child: Text(
                            "Mot de Passe",
                            style: TextStyle(
                                fontFamily: 'Barlow',
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          margin: inputMargin,
                          height: deviceHeight * .07,
                          width: deviceWidth,
                          decoration: inputDecoration,
                          child: TextFormField(
                            validator: (value) {
                              if (value.isEmpty) {
                                return "Veillez remplire le champ";
                              } else {
                                passeword = value;
                              }
                              return null;
                            },
                            obscureText: true,
                            cursorColor: Colors.grey,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  size: 20,
                                ),
                                border: InputBorder.none,
                                hintText: '************'),
                          ),
                        ),
                        /*Container(
                            margin: EdgeInsets.only(left: 15,top: 10),

                            child: Text("$errorMessage"),),*/
                        InkWell(
                          onTap: seveUser,
                          child: Container(
                            margin: EdgeInsets.only(
                                top: deviceHeight * .07,
                                left: deviceWidth * .15,
                                right: deviceWidth * .15),
                            height: deviceHeight * .07,
                            width: deviceWidth,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                //color: Color(0xff10182b)
                                gradient: LinearGradient(colors: [
                                  Color.fromRGBO(165, 31, 156, 1),
                                  Color.fromRGBO(67, 2, 63, 1),
                                ])),
                            child: Center(
                              child: Text(
                                loader ? 'Loading ...' : 'inscription',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Barlow',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamed(ConexionPage.routeName),
                          child: Container(
                            margin: EdgeInsets.only(top: deviceHeight * .05),
                            alignment: Alignment.topRight,
                            child: Text(
                              "Se connecter",
                              style: TextStyle(
                                  color: Color.fromRGBO(16, 24, 43, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: deviceHeight * .03,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
