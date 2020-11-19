// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

UserModel userFromMap(String str) => UserModel.fromMap(json.decode(str));

String userToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  UserModel({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.image,
    this.email,
    this.address,
    this.lat,
    this.long,
  });
  String id;
  String username;
  String firstName;
  String lastName;
  String image;
  String email;
  String address;
  double lat;
  double long;

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"] == null ? null : json["id"],
        username: json["username"] == null ? null : json["username"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        image: json["image"] == null ? null : json["image"],
        email: json["email"] == null ? null : json["email"],
        address: json["address"] == null ? null : json["address"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        long: json["long"] == null ? null : json["long"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "id":id == null ? null : id,
        "username": username == null ? null : username,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "image": image == null ? null : image,
        "email": email == null ? null : email,
        "address": address == null ? null : address,
        "lat": lat == null ? null : lat,
        "long": long == null ? null : long,
      };
}
