import 'package:flutter/material.dart';
import 'package:mynan/pageModel.dart';

class Projet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            pageModel(context, Colors.green, Colors.green, "C Sharp",
                "Pourcentage 75%", "01-11-20", Icons.check),
            pageModel(context, Colors.orange, Colors.orange, "Back End",
                "Pourcentage 50%", "11-12-20", Icons.check),
            pageModel(context, Colors.red, Colors.red, "Go", "Pourcentage 30%",
                "30-12-20", Icons.close),
          ],
        ),
      ),
    );
  }
}
