import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(67, 2, 63, 1);


List<String> userDefaultImageUrl = [
  "",
]

Widget reightMessage (BuildContext context ,rdse){

  return    Padding(
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
                        rdse,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ))
                ],
              ),
              Row(
                children: <Widget>[
                  Text('12:24',
                      style: TextStyle(fontSize: 10, color: Colors.grey)),
                  Icon(Icons.check, size: 12),
                ],
              )
            ],
          )
        ],
      ),
    );


 
}


Widget leftMessage (BuildContext context ,String message){
    
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
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            topRight: Radius.circular(5)),
                      ),
                      child: Text(
                        message,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
              Row(
                children: <Widget>[
                  Text('12:24',
                      style: TextStyle(fontSize: 10, color: Colors.grey)),
                  Icon(Icons.check, size: 12),
                ],
              )
            ],
          )
        ],
      ),
    );
  
}