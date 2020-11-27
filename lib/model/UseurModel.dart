// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

UserModel userFromMap(String str) => UserModel.fromMap(json.decode(str));

String userToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  UserModel({
   
    this.username,
    this.image,
    this.email,
   
  });
  String username;
  String image;
  String email;

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        username: json["username"] == null ? null : json["username"],
        image: json["image"] == null ? null : json["image"],
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toMap() => {
        "username": username == null ? null : username,
        "image": image == null ? null : image,
        "email": email == null ? null : email,
      };
}
