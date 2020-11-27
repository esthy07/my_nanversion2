import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:mynan/Provider/utilisateurService.dart';
import 'package:mynan/model/utilisateurModel.dart';

class UtilisateurProvider extends ChangeNotifier{

  UtilisateurService _utilisateurService;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Utilisateur _currentUser;
  Utilisateur get loggedInUser => _currentUser;

  List<Utilisateur> _allUtilisateurs = [];
  List<Utilisateur> get allUtilisateurs => _allUtilisateurs;


  /*Future initState() async {
    var res = await UtilisateurService.streamUtilisateurs();
    res.listen((thy) {
      _allUtilisateurs = thy;
      notifyListeners();
    });
  }*/

  /*Future updateUtilisateurs({@required Utilisateur utilisaateur, @required bool isInscrit}) async {
    await UtilisateurService.updateUtilisateur(utilisateur: utilisaateur, isInscrit: isInscrit);
    print('en cours');
  }*/

  /*Future updatePasswords({Utilisateur utilisateur}) async{
    await UtilisateurService.updatePassword(utilisateur: utilisateur);
  }*/

  Future<bool> isUserLoggedIn() async {
    var user = _auth.currentUser;
    await connectCurrentUser(user);
    return user != null;
  }

  Future<void> connectCurrentUser(User user) async{
    if(await isUserLoggedIn()) {
      _currentUser = await _utilisateurService.getUser(user.uid);
      notifyListeners();

    }
  }
}