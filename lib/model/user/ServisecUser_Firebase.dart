



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
    //print('_userCreat =====$_userCreat') ;
    //var t =  await varifaidNombre() ;
    //print('rification nombre == $t') ;
    if(_userCreat != 'Errur' && _userCreat != null    ) {
      CollectionReference _users = FirebaseFirestore.instance.collection(
          'users');
      try {
        _users.add({
          'name': user.name,
          'uid': _userCreat,
          'nombrePhon': user.nombrePhon,
          'email': user.email,
          'image' : user.image ,
          'password' : 'password' ,
        });
        return true ;
      }catch(e){
        //print('no add user erurr = $e') ;
        return e.message ;
      }
    }else {
      return false;
    }

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