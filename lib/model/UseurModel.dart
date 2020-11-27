// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

UserModel userFromMap(String str) => UserModel.fromMap(json.decode(str));

String userToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  UserModel(
      {this.username,
      this.image,
      this.email,
      this.firstname,
      this.lastname,
      this.number,
      this.parcour,
      this.place,
      this.address,
      this.ville});

  String username;
  String image;
  String email;
  String firstname;
  String lastname;
  String number;
  String parcour;
  GeoPoint place;
  String address;
  String ville; // Ce cham vas nous pernetre de filtré notre requette 

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        username: json["username"] == null ? null : json["username"],
        image: json["image"] == null ? null : json["image"],
        email: json["email"] == null ? null : json["email"],
        firstname: json["firstname"] == null ? null : json["firstname"],
        lastname: json["lastname"] == null ? null : json["lastname"],
        number: json["number"] == null ? null : json["number"],
        parcour: json["parcour"] == null ? null : json["parcour"],
        // place: json["place"] == null ? null : json["place"],
        address: json["address"] == null ? null : json["address"],
        ville: json["ville"] == null ? null : json["ville"],
      );

  Map<String, dynamic> toMap() => {
        "username": username == null ? null : username,
        "image": image == null ? null : image,
        "email": email == null ? null : email,
        "firstname": firstname == null ? null : firstname,
        "lastname": lastname == null ? null : lastname,
        "number": number == null ? null : number,
        "parcour": parcour == null ? null : parcour,
        // "place": place == null ? null : place.toString(),
        "address": address == null ? null : address,
        "ville": ville == null ? null : ville,
      };
}
