import 'package:flutter/material.dart';

class ModifUtilisateur extends StatefulWidget {

  static const routeName = 'modifUtilisateur';

  @override
  _ModifUtilisateurState createState() => _ModifUtilisateurState();
}

class _ModifUtilisateurState extends State<ModifUtilisateur> {

  final GlobalKey<FormState> _modifierFormKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Modifer user'),
      ),
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        child: SingleChildScrollView(
          child: Form(
            key: _modifierFormKey,
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
                      //controller: nomController,
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
                      //controller: prenomController,
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
                      //controller: communeController,
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
                      //controller: parcoursController,
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
                      //controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      //validator: emailValidator,
                    ),
                  ),
                  SizedBox(height: 30,),

                  RaisedButton(
                      child: Text('modifier'),
                      onPressed: () {
                        print('esthy est la');
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
