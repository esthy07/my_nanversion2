import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'screens/HomePages/home.dart';
import 'screens/homeTest.dart';
import 'widgets/drawer.dart';
import 'widgets/parcoursWidget.dart';

class TestPage extends StatefulWidget {

  TestPage({Key key}) : super(key: key);

  static const routeName = 'testPage';

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {


  final GlobalKey<FormState> _inscriptionFormKey = GlobalKey<FormState>();
  TextEditingController nomController;
  TextEditingController prenomController;
  TextEditingController communeController;
  TextEditingController parcoursController;
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  initState() {
    nomController = new TextEditingController();
    prenomController = new TextEditingController();
    communeController = new TextEditingController();
    parcoursController = new TextEditingController();
    emailController = new TextEditingController();
    passwordController = new TextEditingController();
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String passwordValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }
  
  Future<void> registerUser() {

    /*
    *  Future createUser(User user) async {
    try {
      await _usersCollectionReference.document(user.id).setData(user.toJson());
    } catch (e) {
      return e.message;
    }
  }*/
    
    if (_inscriptionFormKey.currentState.validate()) {
      FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text).then((currentUser) => FirebaseFirestore.instance
          .collection("utilisateurs").doc(currentUser.user.uid)
          .set({
        'uid': currentUser.user.uid,
        'commune': communeController.text,
        'email': emailController.text,
        'nom': nomController.text,
        'parcours': parcoursController.text,
        'prenom': prenomController.text
      }).then((result) => {
     Navigator.of(context).pushReplacement(
       MaterialPageRoute(
         builder: (BuildContext context) {
           return HomeTest();
         },
       ),
     ),
        emailController.clear(),
        nomController.clear(),
        parcoursController.clear(),
        communeController.clear(),
        passwordController.clear(),
        prenomController.clear()
      }).catchError((error) => print(error))
      ).catchError((error) => print(error));
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("The passwords do not match"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  /*Future<void> signupUtilisateur({
    @required String commune,
    @required String parcours,
    @required String nom,
    @required String prenom,
    @required String email,
}) async {
    var result = await _authenticationService.signUpWithEmail(
      email: email,
      password: password,
      fullName: fullName,
      role: _selectedRole,
    );
  }*/


  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        title: Text('Test Inscription', style: TextStyle(
          fontSize: 14, fontFamily: 'Barlow'
        ),),
      ),
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        child: SingleChildScrollView(
          child: Form(
            key: _inscriptionFormKey,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: deviceWidth / 1.3,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "entrez votre nom"),
                      controller: nomController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: deviceWidth / 1.3,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                          hintText: "entrez votre prenoms"),
                      controller: prenomController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: deviceWidth / 1.3,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "entrez votre commune"),
                      controller: communeController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: deviceWidth / 1.3,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "entrez votre parcours"),
                      controller: parcoursController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: deviceWidth / 1.3,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "entrez votre email"),
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: emailValidator,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 50,
                    width: deviceWidth / 1.3,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "entrez votre password",
                        border: InputBorder.none,),
                      controller: passwordController,
                      keyboardType: TextInputType.emailAddress,
                      validator: passwordValidator,
                    ),
                  ),
                  SizedBox(height: 30,),

                  RaisedButton(
                    child: Text('envoyer'),
                      onPressed: () {
                        registerUser();
                      }
                  )
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
