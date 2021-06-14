



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:phoneshop/model/user/user.dart';

class UserFire {

  //final String email ;
  //final String password ;
  final  UserLocalModel user ;

  UserFire({@required this.user });


  creatDataUser() async  {
    var _userCreat =  await  creatUser() ;
    print('_userCreat =====$_userCreat') ;
    var t =  await varifaidNombre() ;
    print('rification nombre == $t') ;
    if(_userCreat != 'Errur' && _userCreat != null  && t != null  ) {
      CollectionReference _users = FirebaseFirestore.instance.collection(
          'users');
      try {
        _users.add({
          'name': user.name,
          'id': _userCreat,
          'nombrePhon': user.nombrePhon,
          'email': user.email,
        });
        return true ;
      }catch(e){
        print('no add user erurr = $e') ;
        return false ;
      }
    }else {
      return false;
    }

  }

  varifaidNombre()async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+213665489218',
      verificationCompleted: (PhoneAuthCredential credential) async  {print('verificationCompleted credential ====> ===> $credential') ; },
      verificationFailed: (FirebaseAuthException e) async  {print('verificationId feild ===$e') ; },
      codeSent: (String verificationId, int resendToken) async  {print('cod is send verificationId ========> =====> ====> $verificationId') ; },
      codeAutoRetrievalTimeout: (String verificationId) async  { print('codeAutoRetrievalTimeout verificationId ====> ===> $verificationId ') ; },
    );

  }









  creatUser() async {
    var _result  ;
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: user.password ).then((value){
      _result =  value.user.uid ;
    }).onError((error, stackTrace) {
      print('eruur creatUser  from ceatUser 44 lin ===> $error') ;
     _result =  'Errur' ;
    });
    return _result ;
  }

  login() async {
   await  FirebaseAuth.instance.signInWithEmailAndPassword(email: user.email, password: user.password).then((value){
      return true ;
    }).onError((error, stackTrace) {
      print('eruur login ==> $error') ;
      return false ;

    }) ;
  }


}