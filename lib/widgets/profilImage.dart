import 'package:flutter/material.dart';

class ProfilImage extends StatelessWidget {
  const ProfilImage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Tooltip(
        message: "Angré deux plateaux",
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/bg-header.jpg'),
          radius: 30,
        ),
      ),
    );
  }
}
