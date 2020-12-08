import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

import 'package:google_maps_webservice/places.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/Provider/UserProv.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:mynan/widgets/profilWidget/LigneDimo.dart';
import 'package:provider/provider.dart';
import 'modif_profil.dart';
import 'package:mynan/Provider/localPlaceMethode.dart';

import 'package:geolocator/geolocator.dart';

const kGoogleApiKey = "AIzaSyCk77TfuPCTmAYFGMB2sF27Tb3LhJYHt7Q";
GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);

class ModifierProfil extends StatefulWidget {
  @override
  _ModifierProfilState createState() => _ModifierProfilState();
}

class _ModifierProfilState extends State<ModifierProfil> {
  final _auth = FirebaseAuth.instance;
  LocalPlaceMethode localPlaceMethode = LocalPlaceMethode();
  UserModel currentUsers;

  Future<void> uploadLocation() async {
    try {
      Map<String, dynamic> result =
          await localPlaceMethode.handlePressButton(context);
      final lat = result['lat'] as double;
      final lng = result['long'] as double;
      currentUsers.place = [lat, lng];
      currentUsers.address = result["address"];
      currentUsers.ville = result["ville"];
      Provider.of<UserProv>(context, listen: false).updateUser(currentUsers);
    } catch (e) {
      print("Error to update Location ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    currentUsers = Provider.of<UserProv>(context).loggedInUser;
    return Scaffold(
      body: Container(
        child: ListView(
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
                          offset: Offset(0, 5))
                    ],
                    color: Colors.white,
                    image: DecorationImage(
                      //image: NetworkImage(currentUsers?.image)
                        image: AssetImage("assets/images/apple.jpg"),
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
                              image: NetworkImage(currentUsers?.image),
                              fit: BoxFit.cover),
                          border: Border.all(width: 4, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      if(currentUsers.firstname != null && currentUsers.lastname != null)
                      Text(
                        "${currentUsers.firstname} ${currentUsers.lastname}",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Barlow'),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      if(currentUsers.parcour != null )
                      Text(
                        "${currentUsers.parcour}",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "User Information",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Barlow'),
                      ),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: primaryColor,
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, ModifProfil.routeName);
                        })
                  ],
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
                          LigneDomi(
                              icon: Icons.location_on,
                              titre: "Localisation",
                              desc: currentUsers?.address != null
                                  ? "${currentUsers?.address}"
                                  : "...",
                              mod: "Saisir votre Localité",
                              coolback: uploadLocation),
                          // LigneDomi( Icons.location_on, "",
                          //     "cocody", "Saisir votre Localité"),
                          Divider(),
                          LigneDomi(
                            icon: Icons.email,
                            titre: "Email",
                            desc: "${_auth.currentUser.email}",
                            mod: "Saisir votre Email",
                          ),
                          Divider(),
                          LigneDomi(
                            icon: Icons.email,
                            titre: "Phone",
                            desc: currentUsers?.number != null
                                ? "${currentUsers?.number}"
                                : "...",
                            mod: "Saisir votre Numero",
                          ),

                          Divider(),
                          LigneDomi(
                            icon: Icons.email,
                            titre: "Parcour",
                            desc: currentUsers?.parcour != null
                                ? "${currentUsers?.parcour}"
                                : "...",
                            mod: "Saisir votre Parcour",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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

  showModal() {
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
                      "mod",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                TextField(),
                Padding(
                  padding: const EdgeInsets.only(left: 270, top: 5),
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
  }
}
