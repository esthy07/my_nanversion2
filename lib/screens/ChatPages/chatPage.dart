import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    Widget rdp(String rdse) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    rdse,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
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
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                          topRight: Radius.circular(5)),
                      color: Theme.of(context).primaryColor),
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    msg,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff10182b),
        title: Text(
          'ChatRoom',
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_vert, color: Colors.white),
              onPressed: () {
                // Scaffold.of(context).showSnackBar(SnackBar());
              })
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      Colors.grey[200].withOpacity(0.8), BlendMode.lighten),
                  image: AssetImage('assets/images/nan.png'),
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
                      msg('Bonjour'),
                      rdp("Bonjour tu vas bien ? je suis un peu occupé on cause après"),
                      msg('oui et toi?'),
                      msg("Bien et toi ?"),
                      rdp("Bonjour tu vas bien ? je suis un peu occupé on cause après"),
                      rdp("Bonjour tu vas bien ? je suis un peu occupé on cause après"),
                      rdp("Bonjour tu vas bien ? je suis un peu occupé on cause après"),
                      msg('oui et toi?'),
                      msg("Bien et toi ?"),
                      rdp("Bonjour"),
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
