import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mynan/Provider/UserProv.dart';
import 'package:mynan/model/UseurModel.dart' as LocalUser;
import 'package:mynan/screens/HomePages/home.dart';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../Constantes/customeTheme.dart';
import '../../model/UseurModel.dart';
import '../HomePages/homePage.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';

class Register extends StatefulWidget {
  static const routeName = "Register";
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email;
  String passeword;
  String numerotControleur;
  final _auth = FirebaseAuth.instance;

  Random _rnd = Random();
  bool loader = false;
  
  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  Future<void> seveUser() async {
    bool isOk = _formKey.currentState.validate();
    print("Add News user ");
    final String userName = "NaN4.21_" + getRandomString(4);
    if (isOk) {
      setState(() {
        loader = true;
      });
      try {
        final newUser = await _auth.createUserWithEmailAndPassword(
            email: email, password: passeword);
        if (newUser != null) {
          print(newUser);

          var rng = new Random();
          UserModel newUserProv = UserModel(
              email: newUser.user.email,
              image:
                  userDefaultImageUrl[rng.nextInt(userDefaultImageUrl.length)],
              username: userName);
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

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    BoxDecoration inputDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Color(0xff10182b).withOpacity(0.2),
          blurRadius: 5,
          offset: Offset(7, 5),
        ),
      ],
    );
    Widget champ(
      IconData icon,
      String input,
      TextEditingController myController,
    ) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xff10182b).withOpacity(0.2),
              blurRadius: 5,
              offset: Offset(7, 5),
            ),
          ],
        ),
        height: 60,
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width / 1.4,
        alignment: Alignment.center,
        child: TextField(
          controller: myController,
          decoration: InputDecoration(
              prefixIcon: Icon(icon),
              border: InputBorder.none,
              hintText: input),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 90),
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0xff10182b).withOpacity(0.2),
                        blurRadius: 5,
                        offset: Offset(7, 5),
                      ),
                    ],
                    image: DecorationImage(
                      image: AssetImage('assets/images/nan.png'),
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(height: 90),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: inputDecoration,
                      height: 60,
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 1.4,
                      alignment: Alignment.center,
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "veillez remplire le champ ";
                          } else {
                            email = value;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            border: InputBorder.none,
                            hintText: "Email"),
                      ),
                    ),
                    Container(
                      decoration: inputDecoration,
                      height: 60,
                      margin: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width / 1.4,
                      alignment: Alignment.center,
                      child: TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Veillez remplire le champ";
                          } else {
                            passeword = value;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            border: InputBorder.none,
                            hintText: "Password"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              InkWell(
                onTap: seveUser,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff10182b),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0xff10182b).withOpacity(0.2),
                        blurRadius: 5,
                        offset: Offset(7, 5),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.4,
                  child: Text( loader? 'loading...':'inscription',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
