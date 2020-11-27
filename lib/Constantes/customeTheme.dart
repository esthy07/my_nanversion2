import 'package:flutter/material.dart';

const primaryColor = Color.fromRGBO(67, 2, 63, 1);


List<String> userDefaultImageUrl = [
  "https://cdn.pixabay.com/photo/2016/11/14/04/45/elephant-1822636__480.jpg",
  "https://cdn.pixabay.com/photo/2016/11/12/11/51/forest-1818690__480.jpg",
  "https://cdn.pixabay.com/photo/2017/02/20/18/03/cat-2083492__480.jpg",
  "https://cdn.pixabay.com/photo/2017/10/31/07/49/horses-2904536__480.jpg",
  "https://cdn.pixabay.com/photo/2017/01/14/12/59/iceland-1979445__480.jpg",
  "https://cdn.pixabay.com/photo/2016/01/08/11/57/butterfly-1127666__480.jpg",
  "https://cdn.pixabay.com/photo/2017/12/11/15/34/lion-3012515__480.jpg",
  "https://cdn.pixabay.com/photo/2018/07/31/22/08/lion-3576045__480.jpg",
  "https://cdn.pixabay.com/photo/2014/08/29/03/02/horses-430441__480.jpg",
];

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
                          color: primaryColor, fontFamily: 'Barlow', fontSize: 16, fontWeight: FontWeight.w500
                        ),
                      ))
                ],
              ),
              Row(
                children: <Widget>[
                  Text('12:24',
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
                  Text('12:24',
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