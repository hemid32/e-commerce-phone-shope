



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserFire {

  final String email ;
  final String password ;

  UserFire({@required this.email,@required this.password });

  creatUser(){
    FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password).then((value){
      return true ;
    }).onError((error, stackTrace) {
      print('eruur creatUser ==> $error') ;
      return false ;
    });
  }

  login(){
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password).then((value){
      return true ;
    }).onError((error, stackTrace) {
      print('eruur login ==> $error') ;
      return false ;

    }) ;
  }


}