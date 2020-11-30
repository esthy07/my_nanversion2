import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';

class LeftMessage extends StatelessWidget {
  String message;
  DateTime time;
  LeftMessage(this.message,this.time);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      constraints: BoxConstraints(minWidth: 10, maxWidth: 300),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            topRight: Radius.circular(5)),
                      ),
                      child: Text(
                        message,
                        style: TextStyle(
                            color: Colors.white,fontFamily: 'Barlow', fontSize: 16, fontWeight: FontWeight.w500
                        ),
                      ))
                ],
              ),
              Row(
                children: <Widget>[
                 Text( DateFormatter.getVerboseDateTimeRepresentation(time),
                      style: TextStyle(fontSize: 10, color: Colors.grey)),
                  Icon(Icons.done_all, size: 12,color: Colors.green,),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
