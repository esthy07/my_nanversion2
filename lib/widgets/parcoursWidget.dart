import'package:flutter/material.dart';

class ParcoursWidget extends StatefulWidget {
  Color colorModule;
  Color colorParcours;
  String nomModule;
  Color colorNomParcours;
  Color colorPourcentage;
  ParcoursWidget({this.colorModule,this.colorParcours,this.nomModule, this.colorNomParcours, this.colorPourcentage});

  @override
  _ParcoursWidgetState createState() => _ParcoursWidgetState();
}

class _ParcoursWidgetState extends State<ParcoursWidget> {



  @override
  Widget build(BuildContext context) {

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return   Container(
      padding: EdgeInsets.only(left: deviceWidth * .05),
      margin: EdgeInsets.only(top: deviceHeight * .02),
      //height: deviceHeight * .2,
      width: deviceWidth / 1.4,
      decoration: BoxDecoration(
          color: widget.colorParcours,
          borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: deviceHeight * .02),
            child: Row(
              children: <Widget>[
                Icon(Icons.school, color: widget.colorNomParcours,),
                Container(
                  margin: EdgeInsets.only(left: deviceWidth * .02),
                  child: Text('Information Pacours', style: TextStyle(
                      color: widget.colorNomParcours, fontWeight: FontWeight.w500, fontSize: 20, fontFamily: 'Barlow'
                  ),),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: deviceHeight * .02),
            child: Column(
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Text('Module:', style: TextStyle(
                          color: Colors.black54, fontSize: 17, fontFamily: 'Barlow'
                      ),),
                      SizedBox(width: deviceWidth * .02,),
                      Text("${widget.nomModule}", style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500, fontFamily: 'Barlow', color: widget.colorModule
                      ),)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: deviceHeight * .01),
                  child: Row(
                    children: <Widget>[
                      Text('Status:', style: TextStyle(
                          color: Colors.black54, fontSize: 17, fontFamily: 'Barlow'
                      ),),
                      SizedBox(width: deviceWidth * .02,),
                      Text('Pas valider', style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500, fontFamily: 'Barlow'
                      ),)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: deviceHeight * .01),
                  child: Row(
                    children: <Widget>[
                      Text('Progression:', style: TextStyle(
                          color: Colors.black54, fontSize: 17, fontFamily: 'Barlow'
                      ),),
                      SizedBox(width: deviceWidth * .02,),
                      Text('En cours', style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500, fontFamily: 'Barlow'
                      ),)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: deviceHeight * .01),
                  child: Row(
                    children: <Widget>[
                      Text('Pourcentage:', style: TextStyle(
                          color: Colors.black54, fontSize: 17, fontFamily: 'barlow'
                      ),),
                      SizedBox(width: deviceWidth * .02,),
                      Text('75%', style: TextStyle(
                          fontSize: 17, fontWeight: FontWeight.w500, color: widget.colorPourcentage, fontFamily: 'Barlow'
                      ),)
                    ],
                  ),
                ),
               // SizedBox(height: deviceHeight * .02,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
