import 'package:flutter/material.dart';
import 'package:mynan/model/UseurModel.dart';

class ContactContainer extends StatelessWidget {
  UserModel user;
  Function coolBackFunc;
  ContactContainer(this.user,this.coolBackFunc);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        top: 10,
      ),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: coolBackFunc,
            child: Container(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.image),
                    maxRadius: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${user.username}",
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Barlow'),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
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
