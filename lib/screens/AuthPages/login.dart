import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/screens/AuthPages/register.dart';
import 'package:mynan/screens/HomePages/home.dart';

class Login extends StatefulWidget {
  static const routeName = "Login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Widget champ(
      IconData icon,
      String input,
    ) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          /*boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xff10182b).withOpacity(0.2),
              blurRadius: 5,
              offset: Offset(7, 5),
            ),
            // BoxShadow(
            //   color: Color(0xff10182b),
            //   blurRadius: 10,
            //   offset: Offset(-8, -6),
            // )
          ],*/
        ),
        height: 60,
        margin: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width / 1.4,
        alignment: Alignment.center,
        child: TextField(
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
          color: Colors.white,
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
                    /* boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0xff10182b).withOpacity(0.2),
                        blurRadius: 5,
                        offset: Offset(7, 5),
                      ),
                    ],*/
                    image: DecorationImage(
                      image: AssetImage('assets/images/nan.png'),
                    ),
                    borderRadius: BorderRadius.circular(20)),
              ),
              SizedBox(height: 90),
              champ(Icons.person, "nom d'utlisateur ou email"),
              champ(Icons.lock_outline, "mot de passe"),
              SizedBox(height: 20),
              InkWell(
                onTap: () => Navigator.pushNamed(context, Home.routeName),
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
                  child:
                      Text('connexion', style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () =>
                    Navigator.of(context).pushNamed(Register.routeName),
                child: Container(
                  child: Text(
                    "S'inscrire",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
