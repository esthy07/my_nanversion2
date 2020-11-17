import 'package:flutter/material.dart';
import 'package:mynan/pageModel.dart';

class LiveCoding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            pageModel(context, Colors.green, Colors.green, "Frond End",
                "Pourcentage 90%", "20-10-20", Icons.check),
            pageModel(context, Colors.orange, Colors.orange, "Pascal",
                "Pourcentage 54%", "05-11-20", Icons.check),
            pageModel(context, Colors.red, Colors.red, "Phyton",
                "Pourcentage 47%", "12-11-20", Icons.close),
          ],
        ),
      ),
    );
  }
}
