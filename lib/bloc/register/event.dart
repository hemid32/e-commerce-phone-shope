
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:phoneshop/model/user/ServisecUser_Firebase.dart';
import 'package:phoneshop/model/user/user.dart';

class EventRegister {}

class EventsRegisters extends EventRegister {


  final UserLocalModel user ;
  final bool allFormIsCompletedTrue ;

  EventsRegisters({@required this.user, @required this.allFormIsCompletedTrue});

  rgisterUser() async  {
    if(allFormIsCompletedTrue){
      UserFire _user = UserFire(
          user: user
      )  ;
      bool isCreat  =  await   _user.creatDataUser() ;
      if(isCreat == true ){
        //print(' name user ===== ${ FirebaseAuth.instance.currentUser.displayName}') ;
        print(' emaail user ===== ${ FirebaseAuth.instance.currentUser.email}') ;
        print(' id user ===== ${ FirebaseAuth.instance.currentUser.uid}') ;
        return true ;

      }else {
        print('eruuur no user created ')  ;
        return 'eruuur no user created ' ;
        //'eruuur no user created '
      }
    }else {
      return 'pleas complete the Form' ;
    }

  }





}