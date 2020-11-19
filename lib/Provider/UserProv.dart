import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserProv with ChangeNotifier {
  static const url = "https://mynan-ffc0a.firebaseio.com/UserModel.json";
  static const KEY_USER = "Patrick_Ethere_Key";
  UserModel _user;

  Future<void> addUser(UserModel newUser) async {
    final response = await http.post(url, body: json.encode(newUser.toMap()));
    if (response.statusCode == 200) {
      print(response.body);
      newUser.id = response.body;
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setString(KEY_USER, json.encode(newUser.toMap()));
      print('login successfully');
    }
  }

  Future<void> updateUser(UserModel userToUpdate) async {
    // const url = "https://mynan-ffc0a.firebaseio.com/${userToUpdate.id}.json";
    final response =
        await http.post(url, body: json.encode(userToUpdate.toMap()));
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(KEY_USER, json.encode(userToUpdate.toMap()));
      print('login successfully');
    }
  }
}
