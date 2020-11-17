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
        color: Color(0xffe9ecef), borderRadius: BorderRadius.circular(6)),
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
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(pourc),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 10),
          child: Column(
            children: [
              Text(date),
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
