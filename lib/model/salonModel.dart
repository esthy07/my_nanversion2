// To parse this JSON data, do
//
//     final salons = salonsFromMap(jsonString);

import 'dart:convert';

Salons salonsFromMap(String str) => Salons.fromMap(json.decode(str));

String salonsToMap(Salons data) => json.encode(data.toMap());

class Salons {
    Salons({
        this.id,
        this.createAt,
        this.sender,
        this.lastMessage,
        this.salonsFor,
    });

    String id;
    String createAt;
    For sender;
    LastMessage lastMessage;
    For salonsFor;

    factory Salons.fromMap(Map<String, dynamic> json) => Salons(
        id: json["id"] == null ? null : json["id"],
        createAt: json["createAt"] == null ? null : json["createAt"],
        sender: json["sender"] == null ? null : For.fromMap(json["sender"]),
        lastMessage: json["lastMessage"] == null ? null : LastMessage.fromMap(json["lastMessage"]),
        salonsFor: json["for"] == null ? null : For.fromMap(json["for"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "createAt": createAt == null ? null : createAt,
        "sender": sender == null ? null : sender.toMap(),
        "lastMessage": lastMessage == null ? null : lastMessage.toMap(),
        "for": salonsFor == null ? null : salonsFor.toMap(),
    };
}

class LastMessage {
    LastMessage({
        this.dateMessages,
        this.message,
    });

    String dateMessages;
    String message;

    factory LastMessage.fromMap(Map<String, dynamic> json) => LastMessage(
        dateMessages: json["dateMessages"] == null ? null : json["dateMessages"],
        message: json["message"] == null ? null : json["message"],
    );

    Map<String, dynamic> toMap() => {
        "dateMessages": dateMessages == null ? null : dateMessages,
        "message": message == null ? null : message,
    };
}

class For {
    For({
        this.email,
        this.image,
        this.username,
    });

    String email;
    String image;
    String username;

    factory For.fromMap(Map<String, dynamic> json) => For(
        email: json["email"] == null ? null : json["email"],
        image: json["image"] == null ? null : json["image"],
        username: json["username"] == null ? null : json["username"],
    );

    Map<String, dynamic> toMap() => {
        "email": email == null ? null : email,
        "image": image == null ? null : image,
        "username": username == null ? null : username,
    };
}
