import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/Provider/UserProv.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'chatPage.dart';

class SalonContainer extends StatefulWidget {
  String titre;
  String lastMessage;
  DateTime heure;
  String image;
  String idSalon;

  SalonContainer(
      {this.titre, this.lastMessage, this.heure, this.image, this.idSalon});

  @override
  _SalonContainerState createState() => _SalonContainerState();
}

class _SalonContainerState extends State<SalonContainer> {
  final _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    UserModel currentUser = Provider.of<UserProv>(context).loggedInUser;
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
                idSalon: widget.idSalon,
                image: widget.image,
                titre: widget.titre,
                otherEmail: widget.titre,
              ),
            )),
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(widget.image),
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
                              "${widget.titre}",
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
                              // if(currentUser.email != widget.titre)
                              // Icon(
                              //   Icons.check,
                              //   color: Colors.grey,
                              //   size: 20,
                              // ),
                              Container(
                                width: MediaQuery.of(context).size.width / 3,
                                child: Text(
                                  "${widget.lastMessage}",
                                  style: TextStyle(
                                      fontFamily: 'Barlow',
                                      color: Colors.black,
                                      fontSize: 12),
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
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: 10, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            //timeago.format(heure, locale: "fr"),
                            DateFormatter.getVerboseDateTimeRepresentation(
                                widget.heure),
                            style: TextStyle(
                                fontFamily: 'Barlow',
                                fontWeight: FontWeight.w500,
                                fontSize: 13),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 4),
                            child: StreamBuilder(
                                stream: _firestore
                                    .collection("ChatRoom")
                                    .doc(widget.idSalon)
                                    .collection("chats")
                                    .where("isRead", isEqualTo: false)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (!snapshot.hasData) {
                                    return Container();
                                  }
                                  int unreadMessage = 0;
                                  for (int i = 0;
                                      i < snapshot.data.docs.length;
                                      i++) {
                                    if (snapshot.data.docs[i]["sender"] !=
                                        currentUser.email) {
                                      unreadMessage++;
                                    }
                                  }
                                  return unreadMessage > 0
                                      ? Container(
                                          height: 22,
                                          width: 22,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: primaryColor),
                                          child: Center(
                                            child: Text(
                                              //timeago.format(heure, locale: "fr"),
                                              "${unreadMessage}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Barlow',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 10),
                                            ),
                                          ),
                                        )
                                      : Container();
                                }),
                          ),
                        ],
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
    ;
  }
}

class DateFormatter {
  static String getVerboseDateTimeRepresentation(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime justNow = now.subtract(Duration(minutes: 1));
    DateTime localDateTime = dateTime.toLocal();

    if (!localDateTime.difference(justNow).isNegative) {
      return "à l'instant";
    }

    String roughTimeString = DateFormat('Hm').format(dateTime);
    if (localDateTime.day == now.day &&
        localDateTime.month == now.month &&
        localDateTime.year == now.year) {
      return roughTimeString;
    }

    DateTime yesterday = now.subtract(Duration(days: 1));
    if (localDateTime.day == yesterday.day &&
        localDateTime.month == yesterday.month &&
        localDateTime.year == yesterday.year) {
      return 'Hier, ' + roughTimeString;
    }

    if (now.difference(localDateTime).inDays < 4) {
      String weekday = DateFormat('EEEE').format(localDateTime);
      return '$weekday, $roughTimeString';
    }

    return '${DateFormat('yMd').format(dateTime)}, $roughTimeString';
  }
}
