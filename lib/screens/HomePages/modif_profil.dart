import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';

class ModifProfil extends StatefulWidget {

  static const routeName = 'modifProfil';

  @override
  _ModifProfilState createState() => _ModifProfilState();
}

class _ModifProfilState extends State<ModifProfil> {
  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text('Modifier Profils', style: TextStyle(
          fontFamily: 'Barlow'
        ),),
      ),
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
