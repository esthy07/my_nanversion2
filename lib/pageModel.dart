import 'package:flutter/material.dart';

Widget pageModel(
  BuildContext context,
  Color iconColor,
  Color themeColor,
  String titre,
  String pourc,
  String date,
  IconData icon,
) {
  return Container(
    padding: EdgeInsets.all(5),
    margin: EdgeInsets.only(top: 20, left: 20, right: 20),
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color(0x1a000000),
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 5))
        ],
        color: Color.fromRGBO(242, 242, 242, 1),
        borderRadius: BorderRadius.circular(6)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 3,
              height: 90,
              color: themeColor,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titre,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, fontFamily: 'Barlow'),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(pourc, style: TextStyle(
                    fontFamily: 'Barlow'
                  ),),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 10),
          child: Column(
            children: [
              Text(date, style: TextStyle(
                fontFamily: 'Barlow'
              ),),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white),
                child: Icon(
                  icon,
                  color: iconColor,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
