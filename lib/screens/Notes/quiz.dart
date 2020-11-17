import 'package:flutter/material.dart';

import '../../pageModel.dart';

class Quiz extends StatelessWidget {
  static const routeName = 'quiz';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            pageModel(context, Colors.green, Colors.green, "Flutter",
                "Pourcentage 80%", "01-11-20", Icons.check),
            pageModel(context, Colors.orange, Colors.orange, "Multimedia",
                "Pourcentage 52%", "17-11-20", Icons.check),
            pageModel(context, Colors.red, Colors.red, "Javascrip",
                "Pourcentage 10%", "20-11-20", Icons.close),
          ],
        ),
      ),
    );
  }
}
