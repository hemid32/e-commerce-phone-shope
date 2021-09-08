



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:phoneshop/model/user/user.dart';

class UserFire {

  //final String email ;
  //final String password ;
  final  UserLocalModel user ;
  final PhoneAuthCredential phonAuth ;

  UserFire({@required this.user , this.phonAuth });


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

    String  message    ;
    bool result = false  ;

    try {
       await FirebaseAuth.instance.signInWithCredential(phonAuth).then((value){
         result = true ;
          try{FirebaseAuth.instance.currentUser.updateEmail(user.email.trim());}catch(e){
            print('email not regester errur ==== $e') ;
          }
         FirebaseAuth.instance.currentUser.updatePassword(user.password)  ;
         FirebaseAuth.instance.currentUser.updateDisplayName(user.name)  ;
         FirebaseAuth.instance.currentUser.updatePhotoURL(user.image)  ;
       }).onError((error, stackTrace) {
         result = false ;
         message = error.message ;
       });


    }catch(e){
      message = e.message ;
      result = false ;

    }

   return {'message': message , 'result': result} ;

  }

  login(String email , String password ) async {
    try {
      print('1') ;

      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      print('logger') ;
      return {'result' : true , 'message' : 'message'} ;
    } on FirebaseAuthException catch (e) {
      print('3 ${e.code}') ;
      if (e.code == 'user-not-found') {
        //print('No user found for that email.');
        return {'result' : false , 'message' :  e.message} ;
      } else if (e.code == 'wrong-password') {
        //print('Wrong password provided for that user.');
        return {'result' : false , 'message' :  e.message} ;
      } else{
        return {'result' : false , 'message' :  'Errur'} ;
      }
    }


  }

   updateUser(String oldPassword , String oldEmail) async {
    /*
    final user = await FirebaseAuth.instance.currentUser;
    final cred = EmailAuthProvider.credential(
        email: user.email, password: currentPassword
    );

    user.reauthenticateWithCredential(cred).then((value) {
      user.updatePassword(newPassword).then((_) {
        //Success, do something
      }).catchError((error) {
        //Error, show something
      });
    }).catchError((err) {

    });

     */
    /*
       if(oldPassword == FirebaseAuth.instance.currentUser )
        FirebaseAuth.instance.currentUser.updateEmail(user.email)  ;
        FirebaseAuth.instance.currentUser.updatePassword(user.password)  ;
        FirebaseAuth.instance.currentUser.updateDisplayName(user.name)  ;
        FirebaseAuth.instance.currentUser.updatePhotoURL(user.image)  ;
        if(FirebaseAuth.instance.currentUser.phoneNumber != user.nombrePhon ){


      }
      
     */
    // Prompt the user to enter their email and password
    //String email = 'barry.allen@example.com';
    //String password = 'SuperSecretPassword!';
    bool result = false ;
    String  message ;
    print('user ====${user.toMap()}') ;
    try {
// Create a credential
      AuthCredential credential = EmailAuthProvider.credential(
          email: oldEmail, password: oldPassword);

// Reauthenticate
      await FirebaseAuth.instance.currentUser.reauthenticateWithCredential(
          credential).then((value) {
        try {
          FirebaseAuth.instance.currentUser.updateEmail(user.email.trim());
        } catch (e) {
          print('email not regester errur ==== $e');
        }
        FirebaseAuth.instance.currentUser.updatePassword(user.password);
        FirebaseAuth.instance.currentUser.updateDisplayName(user.name);
        FirebaseAuth.instance.currentUser.updatePhotoURL(user.image);
      });
      result = true ;
    }catch(e){
      result = false ;
      message = e.message ;
    }


    return {'state' : result , 'message' :  message} ;




  }



  restPasswordForget(String email)async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true ;
    }on FirebaseAuthException catch (e){
      print(e.message) ;
      return e.message ;
    }catch(e){
      return e ;
    }
  }



  




}