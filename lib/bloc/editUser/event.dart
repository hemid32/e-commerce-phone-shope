import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:phoneshop/model/user/user.dart';

class EventEditProfile { }



class EventEditProfileGet extends EventEditProfile {
  final UserLocalModel newUser ;
  final String oldEmeil ;
  final String odlPassword ;
  final String oldNombre ;


  EventEditProfileGet({ @required this.newUser, this.oldEmeil,@required this.odlPassword , @required  this.oldNombre});



}

class EventEditProfileWithPhone extends EventEditProfile {
  final UserLocalModel newUser ;
  final  PhoneAuthCredential phonAuth ;

  EventEditProfileWithPhone({ @required this.newUser , @required this.phonAuth});




}