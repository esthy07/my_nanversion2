import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Widget rdp(String rdse) {
    return Padding(
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

  Widget msg(String msg) {
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
                        msg,
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

  static const menuItems = <String>[
    'One',
    'Two',
  ];
  String _btn3SelectedVal;
  final List<PopupMenuItem<String>> _popUpMenuItems = menuItems
      .map(
        (String value) => PopupMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'ChatRoom',
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            onSelected: (String newValue) {
              _btn3SelectedVal = newValue;
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(_btn3SelectedVal),
                ),
              );
            },
            itemBuilder: (BuildContext context) => _popUpMenuItems,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                image: DecorationImage(
                 fit: BoxFit.cover,
                  image: AssetImage('assets/images/backgroundNaN.png'),
                ),
              ),
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Aujourd'hui",
                              style: TextStyle(color: Colors.grey),
                            ),
                          )
                        ],
                      ),
                      msg("Bonjour tu vas bien ? je suis un peu occupé on cause après bien ? je suis un peu occupé on cause après bien ? je suis un peu occupé on cause après"),
                      rdp("Bonjous"),
                      msg('oui et toi?'),
                      msg("Bien et toi ?"),
                      rdp("Bonjour tu vas bien ? je suis un peu occupé on cause après"),
                      rdp("Bonjour tu vas bien ? je suis un peu occupé on cause après"),
                      rdp("Bonjour tu vas bien ? je suis un peu occupé on cause après"),
                      msg('oui et toi?'),
                      msg("Bien et toi ?"),
                      rdp("Bonjour"),
                      rdp("?"),
                    ],
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 1.3,
                alignment: Alignment.center,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Taper votre message',
                      border: InputBorder.none),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
