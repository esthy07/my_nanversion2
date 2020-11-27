import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynan/Constantes/customeTheme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynan/model/UseurModel.dart';

class UserProv with ChangeNotifier {
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("UserModel");
  static const url = "https://mynan-ffc0a.firebaseio.com/UserModel.json";
  static const KEY_USER = "Patrick_Ethere_Key";
  UserModel _user;
  List<UserModel> _allUsers;

  UserModel get loggedInUser => _user;

  List<UserModel> get allUsers => _allUsers;

  Future<void> addUser(UserModel newUser) async {
    try {
      DocumentReference addedUser = await userCollection.add(newUser.toMap());
      print("Added User");
      print(addedUser);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(KEY_USER, json.encode(newUser.toMap()));
    } catch (e) {
      print("Error to add User ${e.toString()}");
    }

    // final response = await http.post(url, body: json.encode(newUser.toMap()));
    // if (response.statusCode == 200) {
    //   final responseBody = json.decode(response.body) as Map<String, dynamic>;
    //   newUser.id = responseBody["name"];
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   prefs.setString(KEY_USER, json.encode(newUser.toMap()));
    // }
  }

  Future<void> getOneUser(String email) async {
    try {
      print("Email $email");
      final result =
          await userCollection.where("email", isEqualTo: email).get();
      print("Get User ");
      UserModel newUser = UserModel.fromMap(result.docs[0].data());
      print(result.docs[0].data());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(KEY_USER, json.encode(newUser.toMap()));
      _user = newUser;
      notifyListeners();
    } catch (e) {
      print("Eroor to get user by Email ${e.toString()}");
    }
    // var url = "https://mynan-ffc0a.firebaseio.com/UserModel.json?email=$email";
    // final response = await http.get(url);
    // if (response.statusCode == 200) {
    //   final responseBody = json.decode(response.body) as Map<String, dynamic>;
    //   UserModel newUser;
    //   responseBody.forEach((key, value) {
    //     newUser = UserModel.fromMap(value);
    //     // newUser.id = key;
    //   });
    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //   prefs.setString(KEY_USER, json.encode(newUser.toMap()));
    //   _user = newUser;
    //   notifyListeners();
    // }
  }

  Future<void> getAllUser() async {
    try {
      QuerySnapshot result = await userCollection.get();
      print("All user ");
      print(result.docs[0].data());
      List<UserModel> allUser = [];
      result.docs.forEach((element) {
        UserModel newUser = UserModel.fromMap(element.data());
        allUser.add(newUser);
        print("News add");
      });
      _allUsers = allUser;
      print(_allUsers.length);
      notifyListeners();
    } catch (e) {
      print("Error to get all User ${e.toString()}");
    }
    // var url = "https://mynan-ffc0a.firebaseio.com/UserModel.json";
    // final response = await http.get(url);
    // if (response.statusCode == 200) {
    //   final responseBody = json.decode(response.body) as Map<String, dynamic>;
    //   List<UserModel> allUser = [];
    //   responseBody.forEach((key, value) {
    //     UserModel newUser = UserModel.fromMap(value);
    //     // newUser.id = key;
    //     allUser.add(newUser);
    //   });

    //   _allUsers = allUser;
    //   notifyListeners();
    // }
  }

  Future<void> updateUser(UserModel userToUpdate) async {
    // const url = "https://mynan-ffc0a.firebaseio.com/${userToUpdate.id}.json";
    final response =
        await http.post(url, body: json.encode(userToUpdate.toMap()));
    if (response.statusCode == 200) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(KEY_USER, json.encode(userToUpdate.toMap()));
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
    }
    return null;
  }
}
