import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

abstract class BaseAuth{
  String email;
  Future<String> signInWithEmailAndPassword(String email, String password);
  Future<String> createUserWithEmailAndPassword(String email, String password);
  Future<String> fetchSignInMethodsForEmail(String email);
}

class Auth implements BaseAuth{
  String email;

  Future<String> signInWithEmailAndPassword(String email, String password) async{
    this.email = email;
    AuthResult authResult = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return authResult.user.uid;
  }

  Future<String> createUserWithEmailAndPassword(String email, String password) async {
    AuthResult authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    this.email = email;
    return authResult.user.uid;
  }

  Future<String> fetchSignInMethodsForEmail(String email) async {
    List<String> methods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email: email);
    return methods[0];
  }


}