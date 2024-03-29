import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/screens/HomePages/home.dart';
import 'package:mynan/screens/HomePages/homePage.dart';
import 'package:provider/provider.dart';

import '../../Constantes/customeTheme.dart';
import '../../Provider/UserProv.dart';
import 'inscription.dart';

class ConexionPage extends StatefulWidget {
  static const routeName = 'connexionPage';

  @override
  _ConexionPageState createState() => _ConexionPageState();
}

class _ConexionPageState extends State<ConexionPage> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool showLoader = false;
  String errorMessage;
  String email;
  String passeword;
  Future<void> loginUser() async {
    bool isOk = _formKey.currentState.validate();

    if (isOk) {
      setState(() {
        showLoader = true;
      });
      try {
        final newUser = await _auth.signInWithEmailAndPassword(
            email: email, password: passeword);
        if (newUser != null) {
          await Provider.of<UserProv>(context,listen: false).getOneUser(email);
          Navigator.of(context).pushNamed(Home.routeName);
        } else {
          print("Error login ");
          print(newUser);
          setState(() {
            errorMessage = "Login ou mot de passe incorect !!";
            showLoader = false;
          });
        }
      } catch (e) {
        setState(() {
          errorMessage = "Login ou mot de passe incorect !!";
          showLoader = false;
        });
        print("Error ${e.toString()}");
      }


      // User newUser = User(firstName: name, lastName: lastName, username: userName);
      // Provider.of<UserProv>(context, listen: false).addUser(newUser);
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
        //resizeToAvoidBottomInset: false,
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
                              onChanged: (value) {
                                email = value;
                              },
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Veillez emtre un email valide ";
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
                              onChanged: (value) {
                                passeword = value;
                              },
                              validator: (value) {
                                if (value.isEmpty || value.length < 6) {
                                  return "Veillez emtre votre mot de passe ";
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
                          if(errorMessage != null)
                            Container(
                              margin: EdgeInsets.only(left: 15,top: 10),

                              child: Text("$errorMessage"),),
                          InkWell(
                            onTap: loginUser,
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
                                  ])
                              ),
                              child: Center(
                                child: Text(
                                  showLoader?'Loading ...':'Connexion',
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
                            onTap: () =>
                                Navigator.of(context).pushNamed(InscriptionPage.routeName),
                            child: Container(
                              margin: EdgeInsets.only(top: deviceHeight * .05),
                              alignment: Alignment.topRight,
                              child: Text(
                                "S'inscrire",
                                style: TextStyle(color: Color.fromRGBO(16, 24, 43, 1), fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: deviceHeight * .03,)
                ],
              ),
            ),
          ),
        ),
        );
  }
}
