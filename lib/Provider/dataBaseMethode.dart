import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseMethode {
  FirebaseFirestore firebase = FirebaseFirestore.instance;
  CollectionReference chatRoomCollection =
      FirebaseFirestore.instance.collection("ChatRoom");

  Future<String> createChatRoom(List<Map<String, dynamic>> users) async {
    try {
      String chatId = generatChatId(users[0]["email"], users[1]["email"]);
      final result =
          await chatRoomCollection.where("chatRoomId", isEqualTo: chatId).get();
      print(result.docs);
      if (result.docs.isNotEmpty) {
        if (!result.docs[0].exists) {
          Map<String, dynamic> map = {
            "dateLastMessage":DateTime.now(),
            "users": users,
            "chatRoomId": chatId,
            "lastMessage": {"dateAdd": DateTime.now(), "message": ""}
          };
          chatRoomCollection.doc(chatId).set(map).then((value) {
            chatRoomCollection
                .doc(chatId)
                .collection("enLigne")
                .doc(users[0]["email"])
                .set({"dateLigne": null, "enLigne": false});
            chatRoomCollection
                .doc(chatId)
                .collection("enLigne")
                .doc(users[1]["email"])
                .set({"dateLigne": null, "enLigne": false});
          });
        } else {
          print("Le salon exist dejat ");
        }
      } else {
        print("Is Empty");
        Map<String, dynamic> map = {
          "dateLastMessage":DateTime.now(),
          "users": users,
          "chatRoomId": chatId,
          "lastMessage": {"dateAdd": DateTime.now(), "message": ""}
        };
        chatRoomCollection.doc(chatId).set(map).then((value) {
          chatRoomCollection
              .doc(chatId)
              .collection("enLigne")
              .doc(users[0]["email"])
              .set({"dateLigne": null, "enLigne": false});
          chatRoomCollection
              .doc(chatId)
              .collection("enLigne")
              .doc(users[1]["email"])
              .set({"dateLigne": null, "enLigne": false});
        });

        // print(response);
      }
      return chatId;
    } catch (e) {
      print("Error to add News chatRoom ${e.toString()}");
      return null;
    }
  }

  String generatChatId(String user1, String user2) {
    int isOrder = user1.compareTo(user2);
    if (isOrder == 1) {
      return "$user1\_$user2";
    } else {
      return "$user2\_$user1";
    }
  }
}
