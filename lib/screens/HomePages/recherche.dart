import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geodesy/geodesy.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/Provider/UserProv.dart';
import 'package:mynan/Provider/localPlaceMethode.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:mynan/widgets/profilImage.dart';
import 'package:mynan/widgets/rechercheRow.dart';
import 'package:provider/provider.dart';

class Recherche extends StatefulWidget {
  Recherche({Key key}) : super(key: key);

  @override
  _RechercheState createState() => _RechercheState();
}

class _RechercheState extends State<Recherche> {
  LocalPlaceMethode localPlaceMethode = LocalPlaceMethode();
  String rechercherEnFonction = "Mon lieux d'habitation";
  String dropdownValue = " Mon lieux d'habitation";
  bool rechercheEnFonctionDeMonLieux = true;
  UserModel currentUsers;
  final _firestore = FirebaseFirestore.instance;
  bool isInit = true;
  List<List<Map<String, dynamic>>> userRecherche = [];
  Geodesy geodesy = Geodesy();
  String villeToSearche;
  LatLng l1;
  String currentAddress;
  @override
  void initState() {
    currentUsers = Provider.of<UserProv>(context, listen: false).loggedInUser;
    villeToSearche = currentUsers.ville;
    l1 = LatLng(currentUsers.place[0], currentUsers.place[1]);
    super.initState();
  }

  Future<void> changePlaceSearch() async {
    if (!rechercheEnFonctionDeMonLieux) {
      Map<String, dynamic> place = await localPlaceMethode.getCurrentLocation();
      setState(() {
        villeToSearche = place["ville"];
        l1 = LatLng(place["place"][0], place["place"][1]);
        currentAddress = place["address"];
        print("New pLACE ");
        print(l1);
      });
    } else {
      villeToSearche = currentUsers.ville;
      l1 = LatLng(currentUsers.place[0], currentUsers.place[1]);
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height - 70;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/map.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(.9), BlendMode.darken)),
        ),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                  child: Container(
                height: deviceHeight,
                width: deviceWidth,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    StreamBuilder(
                      stream: _firestore
                          .collection("UserModel")
                          .where("ville", isEqualTo: villeToSearche)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<List<Map<String, dynamic>>> userAndDistance = [];
                          List<Map<String, dynamic>> listUser = [];

                          snapshot.data.docs.forEach((element) {
                            UserModel newUser =
                                UserModel.fromMap(element.data());

                            if (newUser.place != null &&
                                newUser.email != currentUsers.email) {
                              LatLng l2 =
                                  LatLng(newUser.place[0], newUser.place[1]);
                              num distance =
                                  geodesy.distanceBetweenTwoGeoPoints(l1, l2);
                              listUser
                                  .add({"user": newUser, "distance": distance});
                            }
                          });
                          listUser.sort(
                              (a, b) => a["distance"].compareTo(b["distance"]));
                          // SUBDIVISé LES LISTE POUR L4AFFICHAGE

                          int multiple = (listUser.length / 3).toInt();

                          if (multiple >= 1) {
                            for (int i = 0; i < multiple; i++) {
                              List<Map<String, dynamic>> sublist =
                                  listUser.sublist(3 * i, 3 + 3 * i);
                              userAndDistance.add(sublist);
                            }
                            if (listUser.length % 3 != 0) {
                              userAndDistance.add(listUser.sublist(
                                  3 * multiple, listUser.length));
                            }
                          } else {
                            userAndDistance.add(listUser);
                          }
                          print("Result ${userAndDistance}");
                          return (userAndDistance.isNotEmpty ||
                                  userAndDistance == null)
                              ? Container(
                                  height: deviceHeight - 200,
                                  child: ListView.builder(
                                    reverse: true,
                                    itemCount: userAndDistance.length,
                                    itemBuilder: (context, index) =>
                                        RecherchRow(userAndDistance[index]),
                                  ),
                                )
                              : Container();
                        } else {
                          return Container();
                        }
                      },
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          ProfilImage(user: currentUsers),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              child: !rechercheEnFonctionDeMonLieux? Text(
                            "Rétrouver un(e) Nanien(en) pres de chez vous ",
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'barlow'),
                          ):Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.place,color: primaryColor,),
                Text(
                  '${.address}',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Rechercher en fonction de :",
                                style: TextStyle(
                                    color: Colors.white, fontFamily: 'Barlow'),
                              ),
                              DropdownButton<String>(
                                value: dropdownValue,
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontFamily: 'Barlow',
                                    fontWeight: FontWeight.w500),
                                underline: Container(
                                  height: 1,
                                  color: Colors.transparent,
                                ),
                                onChanged: (String newValue) async {
                                  setState(() {
                                    dropdownValue = newValue;
                                    rechercheEnFonctionDeMonLieux =
                                        !rechercheEnFonctionDeMonLieux;
                                  });
                                  await changePlaceSearch();
                                },
                                items: <String>[
                                  " Mon lieux d'habitation",
                                  " Ma Positions actuelle"
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              )
                            ],
                          )),
                          SizedBox(height: deviceHeight * .02)
                        ],
                      ),
                    )
                  ],
                ),
              )),
              Positioned.fill(
                  child: SpinKitRipple(
                color: primaryColor,
                size: MediaQuery.of(context).size.height,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
