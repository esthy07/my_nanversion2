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
     await userCollection.add(newUser.toMap());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(KEY_USER, json.encode(newUser.toMap()));
    } catch (e) {
      print("Error to add User ${e.toString()}");
    }
  }

  Future<void> getOneUser(String email) async {
    try {
      final result =
          await userCollection.where("email", isEqualTo: email).get();
      UserModel newUser = UserModel.fromMap(result.docs[0].data());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(KEY_USER, json.encode(newUser.toMap()));
      _user = newUser;
      notifyListeners();
    } catch (e) {
      print("Eroor to get user by Email ${e.toString()}");
    }
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
  }

  Future<void> updateUser(UserModel userToUpdate) async {
    try {
      final userInstance = await userCollection
          .where("email", isEqualTo: userToUpdate.email)
          .get();
      if (userInstance.docs.isNotEmpty) {
        String idDoc = userInstance.docs[0].id;
        userCollection.doc(idDoc).update(userToUpdate.toMap());

        SharedPreferences prefs = await SharedPreferences.getInstance();
        print(userToUpdate.toMap());
        
        prefs.setString(KEY_USER, json.encode(userToUpdate.toMap()));
        _user = userToUpdate;
        notifyListeners();
        print("Mise a jour ok ");
      }
    } catch (e) {
      print("Error to update User ");
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
