import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:mynan/Provider/UserProv.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:mynan/screens/ChatPages/detailListMessage.dart';
import 'package:mynan/widgets/drawer.dart';
import 'package:provider/provider.dart';

class ContactPage extends StatefulWidget {
  ContactPage({Key key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool _init = true;
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    if (_init) {
      await Provider.of<UserProv>(context, listen: false).getAllUser();
      setState(() {
        _init = false;
      });
    }
  }

  final _auth = FirebaseAuth.instance;
  List<UserModel> allUser = [];
  @override
  Widget build(BuildContext context) {
    allUser = Provider.of<UserProv>(context).allUsers;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text(
          'MyNaN Contact',
          style: TextStyle(
              color: Colors.white, fontFamily: 'Barlow', fontSize: 20),
        ),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {}),
        ],
      ),
      drawer: DrawerPage(),
      body: Container(
        child: !_init
            ? ListView.builder(
                itemCount: allUser?.length,
                itemBuilder: (context, index) {
                  if (allUser[index].email != _auth.currentUser.email) {
                    return detailListMessage(context: context,heure: null,idSalon: null,image: allUser[index].image,lastMessage: "",titre: allUser[index].email);
                  }
                  return null;
                },
              )
            : Container(
                child: Center(
                  child: Text("Loading ..."),
                ),
              ),
      ),
    );
    ;
  }
}
