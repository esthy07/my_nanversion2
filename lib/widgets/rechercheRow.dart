import 'package:flutter/material.dart';
import 'package:mynan/widgets/profilImage.dart';

class RecherchRow extends StatefulWidget {
  List<Map<String, dynamic>> userDistanceList;

  RecherchRow(this.userDistanceList);

  @override
  _RecherchRowState createState() => _RecherchRowState();
}

class _RecherchRowState extends State<RecherchRow> {
  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;
    final rowHeight = deviceHeight * .25;
    return Container(
      height: rowHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            child: ProfilImage(user: widget.userDistanceList[0]["user"]),
          ),
          if (widget.userDistanceList.length > 2)
            Container(
              margin: EdgeInsets.only(bottom: rowHeight * .35),
              child: ProfilImage(user: widget.userDistanceList[2]["user"]),
            ),
          if (widget.userDistanceList.length > 1)
            Container(
              child: ProfilImage(user: widget.userDistanceList[1]["user"]),
            )
        ],
      ),
    );
  }
}
