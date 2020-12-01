import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/Provider/UserProv.dart';
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
  String rechercherEnFonction = "Mon lieux d'habitation";
  String dropdownValue = " Mon lieux d'habitation";
  UserModel currentUsers;
  bool isInit = true;
  List<List<Map<String, dynamic>>> userRecherche = [];
  @override
  Future<void> didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    if (isInit) {
    userRecherche = await Provider.of<UserProv>(context, listen: false).rechercheUser();
      setState(() {
        isInit = false;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    currentUsers = Provider.of<UserProv>(context).loggedInUser;
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
                    Container(
                      height: deviceHeight - 200,
                      child: ListView.builder(
                        reverse: true,
                        itemCount: userRecherche.length,
                        itemBuilder: (context, index) => RecherchRow(userRecherche[index]),
                      
                      ),
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
                              child: Text(
                            "Rétrouver un(e) Nanien(en) pres de chez vous ",
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'barlow'),
                          )),
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
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
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
