
import 'package:cloud_firestore/cloud_firestore.dart';

/*class Utilisateur {
  String documentId;
  String email;
  String commune;
  String parcours;
  String nom;
  String prenom;
  
  Utilisateur({
    this.documentId,
    this.email,
    this.commune,
    this.parcours,
    this.nom,
    this.prenom,
 });

  factory Utilisateur.fromFirebaseFirestore(DocumentSnapshot document) {
    Map data = document.data();

    return Utilisateur(
      documentId: document.id,
      email: data['email'] ?? '',
      commune: data['commune'] ?? '',
      parcours: data['parcours'] ?? '',
      nom: data['nom'] ?? '',
      prenom: data['prenom'] ?? '',
    );
  }
}*/

class Utilisateur{
  final String uid;
  final String email;
  final String commune;
  final String parcours;
  final String nom;
  final String prenom;

  Utilisateur({this.uid, this.email, this.commune, this.parcours, this.nom, this.prenom});

  Utilisateur.fromData(Map<String, dynamic> data)
      : uid = data['uid'],
        nom = data['nom'],
        email = data['email'],
        prenom = data['prenom'],
        commune = data['commune'],
        parcours = data['parcous'];

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'commune': commune,
      'parcours': parcours,
    };
  }
}