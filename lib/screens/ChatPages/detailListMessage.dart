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
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChatPage(
              idSalon: idSalon,
              image: image,
              titre: titre,
            ),
          )),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(image),
                    maxRadius: 30,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .02,
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          child: Text(
                            "$titre",
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Barlow'),
                            overflow: TextOverflow.ellipsis,
                          ),
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
                              width: MediaQuery.of(context).size.width / 3,
                              child: Text(
                                lastMessage,
                                style: TextStyle(fontFamily: 'Barlow', color: Colors.grey,),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .06,
                ),
                Expanded(
                  flex:1,
                  child: Container(
                    child:   Text(
                      "$heure",
                      style: TextStyle(
                          fontFamily: 'Barlow', fontWeight: FontWeight.w500, fontSize: 13),
                    ),
                  ),
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
