import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:firebase_database/firebase_database.dart';

class UserProv with ChangeNotifier {
  static const url = "https://mynan-ffc0a.firebaseio.com/UserModel.json";
  static const KEY_USER = "Patrick_Ethere_Key";
  UserModel _user;
  // final dbRef = FirebaseDatabase.instance.reference().child("pets");
  UserModel get loggedInUser => _user;

  Future<void> addUser(UserModel newUser) async {
    final response = await http.post(url, body: json.encode(newUser.toMap()));
    if (response.statusCode == 200) {
      print(response.body);
      final responseBody = json.decode(response.body) as Map<String, dynamic>;
      newUser.id = responseBody["name"];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(KEY_USER, json.encode(newUser.toMap()));
      print('login successfully');
    }
  }

  Future<void> getUser(String email) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);

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

  ///
  /// METHOD : Is_Signed_I
  ///
  Future<bool> isSignedIn() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString(KEY_USER) == null) return false;
    if (!prefs.containsKey(KEY_USER))
      return false;
    else
      return true;
  }

  Future<void> removeUser() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future<void> getUser() async {
    if (await isSignedIn()) {
      final prefs = await SharedPreferences.getInstance();
      var extratData = json.decode(prefs.getString(KEY_USER));
      _user = UserModel.fromMap(extratData);
      notifyListeners();
      print("Get User ${_user.toMap()}");
    }
    return null;
  }
}
