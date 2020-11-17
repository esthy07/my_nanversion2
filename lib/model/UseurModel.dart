// To parse this JSON data, do
//
//     final user = userFromMap(jsonString);

import 'dart:convert';

User userFromMap(String str) => User.fromMap(json.decode(str));

String userToMap(User data) => json.encode(data.toMap());

class User {
    User({
        this.username,
        this.firstName,
        this.lastName,
        this.image,
        this.email,
        this.address,
        this.lat,
        this.long,
    });

    String username;
    String firstName;
    String lastName;
    String image;
    String email;
    String address;
    double lat;
    double long;

    factory User.fromMap(Map<String, dynamic> json) => User(
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
