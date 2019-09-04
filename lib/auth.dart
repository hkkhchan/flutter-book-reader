import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

abstract class BaseAuth{
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> fetchSignInMethodsForEmail(String email);
  Future<String> currentUser();
  Future<void> signOut();
}

class Auth implements BaseAuth{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signInWithEmailAndPassword(String email, String password) async{
    AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return authResult.user.uid;
  }

  Future<String> createUserWithEmailAndPassword(String email, String password) async {
    AuthResult authResult = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return authResult.user.uid;
  }

  Future<String> fetchSignInMethodsForEmail(String email) async {
    List<String> methods = await _firebaseAuth.fetchSignInMethodsForEmail(email: email);
    return methods[0];
  }

  Future<String> currentUser() async {
    final FirebaseUser user = await _firebaseAuth.currentUser();
    return user?.uid;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }


}