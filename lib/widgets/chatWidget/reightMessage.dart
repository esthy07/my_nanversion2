
import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:timeago/timeago.dart' as timeago;

class RightMessage extends StatefulWidget {
  String message;
  DateTime time;
  RightMessage(this.message,this.time)  ;

  @override
  _RightMessageState createState() => _RightMessageState();
}

class _RightMessageState extends State<RightMessage> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                      constraints: BoxConstraints(minWidth: 10, maxWidth: 300),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                      ),
                      child: Text(
                        "${widget.message}",
                        style: TextStyle(
                            color: primaryColor, fontFamily: 'Barlow', fontSize: 16, fontWeight: FontWeight.w500
                        ),
                      ))
                ],
              ),
              Row(
                children: <Widget>[
                  Text(//timeago.format(widget.time, locale: "fr"),
                      DateFormatter.getVerboseDateTimeRepresentation(widget.time,DateTime.now()),
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
