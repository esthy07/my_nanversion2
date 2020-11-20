import 'package:flutter/material.dart';

import 'chatPage.dart';

Widget detailListMessage(
    {BuildContext context,
    String titre,
    String lastMessage,
    String heure,
    String image,
    String idSalon}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 10,
      top: 10,
    ),
    child: Column(
      children: <Widget>[
        InkWell(
          onTap: ()=>null,
          child: Container(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(image),
                  maxRadius: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$titre",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Barlow'),
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
                            lastMessage,
                            style: TextStyle(fontFamily: 'Barlow'),
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
                Text(
                  heure,
                  style: TextStyle(
                      fontFamily: 'Barlow', fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        Divider()
      ],
    ),
  );
}
