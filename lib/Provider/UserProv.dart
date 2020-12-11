import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:mynan/model/UseurModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geodesy/geodesy.dart';

class UserProv with ChangeNotifier {
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection("UserModel");
  static const url = "https://mynan-ffc0a.firebaseio.com/UserModel.json";
  static const KEY_USER = "Patrick_Ethere_Key";
  UserModel _user;
  List<UserModel> _allUsers;
  Geodesy geodesy = Geodesy();
  UserModel get loggedInUser => _user;

  List<UserModel> get allUsers => _allUsers;

  Future<List<List<Map<String, dynamic>>>> rechercheUser({String ville}) async {
    try {
      QuerySnapshot result =
          await userCollection.where("ville", isEqualTo: _user.ville).get();
      List<List<Map<String, dynamic>>> userAndDistance = [];
      List<Map<String, dynamic>> listUser = [];
      LatLng l1 = LatLng(_user.place[0], _user.place[1]);

      result.docs.forEach((element) {
        UserModel newUser = UserModel.fromMap(element.data());
        if (newUser.place != null && newUser.email != _user.email) {
          LatLng l2 = LatLng(newUser.place[0], newUser.place[1]);
          num distance = geodesy.distanceBetweenTwoGeoPoints(l1, l2);
          listUser.add({"user": newUser, "distance": distance});
        }
      });
      listUser.sort((a, b) => a["distance"].compareTo(b["distance"]));

      // SUBDIVISé LES LISTE POUR L4AFFICHAGE

      int multiple = (listUser.length / 3).toInt();

      if (multiple >= 1) {
        for (int i = 0; i < multiple; i++) {
          List<Map<String, dynamic>> sublist =
              listUser.sublist(3 * i, 3 + 3 * i);
          userAndDistance.add(sublist);
        }
        if (listUser.length % 3 != 0) {
          userAndDistance.add(listUser.sublist(3 * multiple, listUser.length));
        }
      } else {
        userAndDistance.add(listUser);
      }
      return userAndDistance;
    } catch (e) {
      print("Error to find uses ${e.toString()}");
      return null;
    }
  }

  Future<void> addUser(UserModel newUser) async {
    try {
      await userCollection.add(newUser.toMap());
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(KEY_USER, json.encode(newUser.toMap()));
      _user = newUser;
      notifyListeners();
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

      List<UserModel> allUser = [];
      result.docs.forEach((element) {
        if (element.data()["place"] != null) {}
        // final point = element.data()["place"] as GeoPoint;
        UserModel newUser = UserModel.fromMap(element.data());
        // newUser.place = GeoPoint(point.latitude,point.longitude);
        allUser.add(newUser);
      });
      _allUsers = allUser;

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
    } else {}
  }
}
