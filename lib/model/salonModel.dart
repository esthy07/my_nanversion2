// To parse this JSON data, do
//
//     final salon = salonFromMap(jsonString);

import 'dart:convert';

Salon salonFromMap(String str) => Salon.fromMap(json.decode(str));

String salonToMap(Salon data) => json.encode(data.toMap());

class Salon {
    Salon({
        this.chatRoomId,
        this.dateLastMessage,
        this.lastMessage,
        this.users,
    });

    String chatRoomId;
    DateTime dateLastMessage;
    LastMessage lastMessage;
    List<User> users;

    factory Salon.fromMap(Map<String, dynamic> json) => Salon(
        chatRoomId: json["chatRoomId"] == null ? null : json["chatRoomId"],
        dateLastMessage: json["dateLastMessage"] == null ? null : DateTime.parse(json["dateLastMessage"].toDate().toString()),
        lastMessage: json["lastMessage"] == null ? null : LastMessage.fromMap(json["lastMessage"]),
        users: json["users"] == null ? null : List<User>.from(json["users"].map((x) => User.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "chatRoomId": chatRoomId == null ? null : chatRoomId,
        "dateLastMessage": dateLastMessage == null ? null : dateLastMessage,
        "lastMessage": lastMessage == null ? null : lastMessage.toMap(),
        "users": users == null ? null : List<dynamic>.from(users.map((x) => x.toMap())),
    };
}

class LastMessage {
    LastMessage({
        this.dateAdd,
        this.message,
    });

    DateTime dateAdd;
    String message;

    factory LastMessage.fromMap(Map<String, dynamic> json) => LastMessage(
        dateAdd: json["dateAdd"] == null ? null : DateTime.parse(json["dateAdd"].toDate().toString()),
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toMap() => {
        "dateAdd": dateAdd == null ? null : dateAdd,
        "message": message == null ? null : message, 
    };
}

class User {
    User({
        this.email,
        this.image,
    });

    String email;
    String image;

    factory User.fromMap(Map<String, dynamic> json) => User(
        email: json["email"] == null ? null : json["email"],
        image: json["image"] == null ? null : json["image"],
    );

    Map<String, dynamic> toMap() => {
        "email": email == null ? null : email,
        "image": image == null ? null : image,
    };
}
