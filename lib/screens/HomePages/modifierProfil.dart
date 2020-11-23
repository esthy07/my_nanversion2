import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/Provider/UserProv.dart';
import 'package:mynan/screens/HomePages/profil_adresse.dart';
import 'package:provider/provider.dart';

class ModifierProfil extends StatelessWidget {

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {

    final currentUsers = Provider.of<UserProv>(context).loggedInUser;

    Widget ligne(IconData icon, String titre, String desc, String mod) {
      return Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: Row(
          children: [
            Icon(
              icon,
              size: 19,
              color: primaryColor,
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titre,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xff10182b), fontFamily: 'Barlow'),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.9,
                  child: Text(
                    desc,
                    style: TextStyle(color: Colors.grey, fontFamily: 'Barlow'),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
                icon: Icon(
                  Icons.edit,
                  size: 17,
                  color: Colors.blue[100],
                ),
                onPressed: () {
                  return showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.all(20),
                          height: 340,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    mod,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              TextField(),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 270, top: 5),
                                child: Row(
                                  children: [
                                    Text('11'),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Icon(Icons.insert_emoticon),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text("ANNULER"),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text("SAUVEGARDER"),
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                })
          ],
        ),
      );
    }

    Widget adresseProfil(IconData icon, String titre, String desc, String mod) {
      return Padding(
        padding: const EdgeInsets.only(top: 20, left: 20),
        child: Row(
          children: [
            Icon(
              icon,
              size: 19,
              color: primaryColor,
            ),
            SizedBox(
              width: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titre,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Color(0xff10182b), fontFamily: 'Barlow'),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.9,
                  child: Text(
                    desc,
                    style: TextStyle(color: Colors.grey, fontFamily: 'Barlow'),
                  ),
                )
              ],
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
                icon: Icon(
                  Icons.edit,
                  size: 17,
                  color: Colors.blue[100],
                ),
                onPressed: () {
                  Navigator.pushNamed(context, ProfilAdresse.routeName);
                })
          ],
        ),
      );
    }

    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 180,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color(0x1a000000),
                        blurRadius: 2,
                        spreadRadius: 0,
                        offset: Offset(0, 5)
                    )
                  ],
                  color: Colors.white,
                  image: DecorationImage(
                      //image: NetworkImage(currentUsers?.image)
                      image: AssetImage("assets/images/jeune1.jpg"),
                      fit: BoxFit.cover),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 130,
                      ),
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100),
                        image: DecorationImage(
                            image: AssetImage("assets/images/jeune.jpg"),
                            fit: BoxFit.cover),
                        border: Border.all(width: 4, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Chelida Domi",
                      style:
                          TextStyle(fontSize: 19, fontWeight: FontWeight.bold, fontFamily: 'Barlow'),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Developpeur",
                      style: TextStyle(fontSize: 17, fontFamily: 'Barlow'),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 180,
                  top: 200,
                ),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "User Information",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Barlow'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 6,
                  child: Container(
                    height: MediaQuery.of(context).size.height / 1.95,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      children: [
                        adresseProfil(Icons.location_on, "Localisation", "cocody",
                            "Saisir votre Localité"),
                        Divider(),
                        ligne(Icons.email, "Email", "${_auth.currentUser.email}",
                            "Saisir votre Email"),
                        Divider(),
                        ligne(Icons.phone, "Phone", "76625311",
                            "Saisir votre Numero"),
                        Divider(),
                        ligne(
                            Icons.person,
                            "Personnel",
                            "connaissances et des compétences, apprises à partir de tâches antérieures",
                            "Parler nous de Vous"),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/nan.png"),
            ),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
