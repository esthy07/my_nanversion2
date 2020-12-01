import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/Provider/UserProv.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:provider/provider.dart';

class ModifProfil extends StatefulWidget {

  static const routeName = 'modifProfil';

  @override
  _ModifProfilState createState() => _ModifProfilState();
}

class _ModifProfilState extends State<ModifProfil> {

  UserModel currentUsers;

  final GlobalKey<FormState> _modifFormKey = GlobalKey<FormState>();

  String firstname;
  String lastname;
  String number;
  String parcour;



  Future<void> updateUsers() async{


  }



  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

     currentUsers = Provider.of<UserProv>(context).loggedInUser;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text('Modifier Profils', style: TextStyle(
          fontFamily: 'Barlow'
        ),),
      ),
      body: Container(
        height: deviceHeight,
        width: deviceWidth,
        color: Color.fromRGBO(242, 242, 242, 1),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: deviceHeight * .04),
                child: Text('User Information', style: TextStyle(
                  fontFamily: 'Barlow', fontSize: 25, fontWeight: FontWeight.bold
                ),),
              ),

              Form(
                key: _modifFormKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: deviceWidth * .05, top: deviceHeight * .03, right: deviceWidth * .05),
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text('Nom: ', style: TextStyle(
                                color: primaryColor, fontFamily: 'barlow', fontSize: 16, fontWeight: FontWeight.bold
                            ),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: deviceWidth * .03),
                            margin: EdgeInsets.only(top: deviceHeight * .01),
                            height: deviceHeight * .07,
                            width: deviceWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x1a000000),
                                    blurRadius: 1,
                                    offset: Offset(0, 2))
                              ],
                            ),
                            child: TextFormField(
                              //controller: nomController,
                              cursorColor: Colors.grey,
                              initialValue: currentUsers?.firstname != null ?'${currentUsers?.firstname}' : '',
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontFamily: 'Barlow', fontSize: 17, fontWeight: FontWeight.w500
                                  )
                              ),
                              validator: (value) {
                                if(value.isEmpty) {
                                  return 'Entrez votre nom';
                                }
                                return null;
                              },
                              onSaved: (value) => currentUsers.firstname = value,
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: deviceWidth * .05, top: deviceHeight * .02, right: deviceWidth * .05),
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text('Prenoms: ', style: TextStyle(
                                color: primaryColor, fontFamily: 'barlow', fontSize: 16, fontWeight: FontWeight.bold
                            ),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: deviceWidth * .03),
                            margin: EdgeInsets.only(top: deviceHeight * .01),
                            height: deviceHeight * .07,
                            width: deviceWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x1a000000),
                                    blurRadius: 1,
                                    offset: Offset(0, 2))
                              ],
                            ),
                            child: TextFormField(
                              //controller: prenomController,
                              cursorColor: Colors.grey,
                              initialValue: currentUsers?.lastname != null ?'${currentUsers?.lastname}' :'',
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontFamily: 'Barlow', fontSize: 17, fontWeight: FontWeight.w500
                                  )
                              ),
                              // ignore: missing_return
                              validator: (value) {
                                if(value.isEmpty) {
                                  return 'Entrez votre prennom';
                                }
                                return null;
                              },
                              onSaved: ( value) => currentUsers.lastname = value,
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: deviceWidth * .05, top: deviceHeight * .02, right: deviceWidth * .05),
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text('Téléphone: ', style: TextStyle(
                                color: primaryColor, fontFamily: 'barlow', fontSize: 16, fontWeight: FontWeight.bold
                            ),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: deviceWidth * .03),
                            margin: EdgeInsets.only(top: deviceHeight * .01),
                            height: deviceHeight * .07,
                            width: deviceWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x1a000000),
                                    blurRadius: 1,
                                    offset: Offset(0, 2))
                              ],
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              //controller: telephoneController,
                              initialValue: currentUsers.number != null ?'${currentUsers.number}' :'',
                              cursorColor: Colors.grey,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontFamily: 'Barlow', fontSize: 17, fontWeight: FontWeight.w500
                                  )
                              ),
                              // ignore: missing_return
                              validator: (value) {
                                if(value.isEmpty) {
                                  return 'Entrez votre numero';
                                }
                                return null;
                              },
                              onSaved: (value) => currentUsers.number = value,
                            ),
                          )
                        ],
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: deviceWidth * .05, top: deviceHeight * .02, right: deviceWidth * .05),
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            child: Text('Parcours: ', style: TextStyle(
                                color: primaryColor, fontFamily: 'barlow', fontSize: 16, fontWeight: FontWeight.bold
                            ),),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: deviceWidth * .03),
                            margin: EdgeInsets.only(top: deviceHeight * .01),
                            height: deviceHeight * .07,
                            width: deviceWidth,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0x1a000000),
                                    blurRadius: 1,
                                    offset: Offset(0, 2))
                              ],
                            ),
                            child: TextFormField(
                              //controller: parcoursController,
                              cursorColor: Colors.grey,
                              initialValue: currentUsers.parcour != null ?'${currentUsers.parcour}' :'',
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                      fontFamily: 'Barlow', fontSize: 17, fontWeight: FontWeight.w500
                                  )
                              ),
                              validator: (value) {
                                if(value.isEmpty) {
                                  return 'Entrez votre nom';
                                }
                                return null;
                              },
                              onSaved: (value) => currentUsers.parcour = value,
                            ),
                          )
                        ],
                      ),
                    ),

                    InkWell(
                      onTap: () async{
                        if (_modifFormKey.currentState.validate()) {
                          _modifFormKey.currentState.save();
                          await Provider.of<UserProv>(context, listen: false).updateUser(currentUsers);
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: deviceHeight * .05, bottom: deviceHeight * .05),
                        height: deviceHeight * .06,
                        width: deviceWidth / 2.2,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(16, 24, 43, 1),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Center(
                          child: Text('Modifier', style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontFamily: 'Barlow', fontSize: 17
                          ),),
                        ),
                      ),
                    )

                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
