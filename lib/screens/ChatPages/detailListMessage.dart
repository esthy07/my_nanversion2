import 'package:flutter/material.dart';

Widget detailListMessage(BuildContext context, String nom, String message,
    String heure, String image) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 10,
      top: 20,
    ),
    child: Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(image),
          maxRadius: 30,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nom,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Icon(
                  Icons.check,
                  color: Colors.grey,
                  size: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Text(
                    message,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Text(heure),
      ],
    ),
  );
}
