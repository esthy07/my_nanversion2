import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:http/http.dart' as http;

class UserProv with ChangeNotifier {
  static const url = "https://mynan-ffc0a.firebaseio.com/User.json";
  User _user;

  Future<void> addUser(User newUser) async {
  final response = await http.post(url,body:json.encode(newUser.toMap()));


  }
}
