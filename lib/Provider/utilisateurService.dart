import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mynan/model/utilisateurModel.dart';

class UtilisateurService {

  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future getUser(String uid) async{
    try{
      var userData = await FirebaseFirestore.instance.collection('utilisateurs').doc(uid).get();
      return Utilisateur.fromData(userData.data());
    }catch (e){
      return e;
    }
  }

 /* static Future<Stream<List<Utilisateur>>> streamUtilisateurs() async {
    var ref = FirebaseFirestore.instance.collection('utilisateurs');

    return ref.snapshots().map((list) => list.docs.map((doc) => Utilisateur.fromData(doc)).toList());

  }*/

  /*static Future updateUtilisateur({
  Utilisateur utilisateur,
    bool isInscrit,
  }) async{

    if(isInscrit) {
      await FirebaseFirestore.instance.collection('utilisateurs').add({
        'nom': utilisateur.nom,
        'prenom': utilisateur.prenom,
        'parcours': utilisateur.parcours,
        'commune': utilisateur.commune,
        'email': utilisateur.email
      });
    } else {
      await FirebaseFirestore.instance.collection('utilisateurs').doc(utilisateur.documentId).set({
        'nom': utilisateur.nom,
        'prenom': utilisateur.prenom,
        'parcours': utilisateur.parcours,
        'commune': utilisateur.commune,
        'email': utilisateur.email,
      });
    }

  }

  static Future updatePassword({
  Utilisateur utilisateur,
  }) async {
    await FirebaseFirestore.instance.collection('utilisateurs').add({
      'password': utilisateur.parcours,
      'userUid': utilisateur.documentId
    });
  }


  Future getUser(String uid) async {
    try {
      var utilisateurData = await FirebaseFirestore.instance.collection('utilisateurs').doc(uid).get();
      return Utilisateur.fromFirebaseFirestore(utilisateurData.doc);
    } catch (e) {
      return e.message;
    }
  }*/


  /*Future signUpWithEmail({
    @required Utilisateur utilisateur,
    @required String email,
    @required String password,
    @required String commune,
    @required String parcours,
    @required String nom,
    @required String prenom,
  }) async {
    try {
      var authResult = await _auth.createUserWithEmailAndPassword(
        email: utilisateur.email,
        password: password,
      );

      // TODO: Create firestore user here and keep it locally.

      return authResult.user != null;
    } catch (e) {
      return e.message;
    }
  }*/
}