import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';

class LigneDomi extends StatelessWidget {
  IconData icon;
  String titre;
  String desc;
  String mod;
  Function coolback;
  LigneDomi({this.icon, this.titre, this.desc, this.mod,this.coolback});

  @override
  Widget build(BuildContext context) {
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
                    fontWeight: FontWeight.bold,
                    color: Color(0xff10182b),
                    fontFamily: 'Barlow'),
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
              onPressed:coolback)
        ],
      ),
    );

    ;
  }
}
