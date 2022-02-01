import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:phoneshop/model/user/user.dart';

class UserFire {
  //final String email ;
  //final String password ;
  final UserLocalModel? user;
  final PhoneAuthCredential? phonAuth;

  UserFire({@required this.user, this.phonAuth});

  creatDataUser(String uid)  {
      CollectionReference _users =
          FirebaseFirestore.instance.collection('users');
      try {
        _users.add({
          'name': user!.name,
          'uid': uid,
          'nombrePhon': user!.nombrePhon,
          'email': user!.email,
          'image': user!.image,
          //'password': 'password',
        });
        return true;
      } catch (e) {
        print('no add user erurr = $e') ;
        //return e.message;
      }

  }



  creatUser() async {
    late String message;
    bool result = false;

    try {
      await FirebaseAuth.instance.signInWithCredential(phonAuth!).then((value) {
        result = true;
        try {
          FirebaseAuth.instance.currentUser!.updateEmail(user!.email.trim());
        } catch (e) {
          print('email not regester errur ==== $e');
        }
        FirebaseAuth.instance.currentUser!.updatePassword(user!.password);
        FirebaseAuth.instance.currentUser!.updateDisplayName(user!.name);
        FirebaseAuth.instance.currentUser!.updatePhotoURL(user!.image);
        creatDataUser( FirebaseAuth.instance.currentUser!.uid ) ;
      }).onError((error, stackTrace) {
        result = false;
        message = error.toString();
      });
    } catch (e) {
      message = e.toString();
      result = false;
    }

    return {'message': message, 'result': result , 'uid' : FirebaseAuth.instance.currentUser!.uid };
  }

  /*
  loginWithFone()async  {
    final AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: 'verificationId',
      smsCode: 'smsCode',
    );


    await FirebaseAuth.instance.signInWithCredential(credential) ;
  }
  
   */

  login(String email, String password) async {
    try {
      print('1');

      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      print('logger');
      return {'result': true, 'message': 'message'};
    } on FirebaseAuthException catch (e) {
      print('3 ${e.code}');
      if (e.code == 'user-not-found') {
        //print('No user found for that email.');
        return {'result': false, 'message': e.message};
      } else if (e.code == 'wrong-password') {
        //print('Wrong password provided for that user.');
        return {'result': false, 'message': e.message};
      } else {
        return {'result': false, 'message': 'Errur'};
      }
    }
  }

  updateUser(String oldPassword, String oldEmail , String oldNombre ) async {
    /*
    PhoneAuthCredential phonAuth =  PhoneAuthProvider.credential(
         verificationId: 'verificationId', smsCode: 'smsCode' );
     */
    bool result = false;
    String message = 'Error';
    print('user ====${user!.toMap()}');
    String target = 'non' ;
    try {
// Create a credential
      AuthCredential credential =
          EmailAuthProvider.credential(email: oldEmail, password: oldPassword);

// Reauthenticate
      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(credential)
          .then((value) {

            if(oldNombre != user!.nombrePhon){
              print('change nombre phone ') ;
              target = 'change_phone' ;

            }else {
              try {
                FirebaseAuth.instance.currentUser!.updateEmail(user!.email.trim());
                FirebaseAuth.instance.currentUser!.updatePassword(user!.password);
                FirebaseAuth.instance.currentUser!.updateDisplayName(user!.name);
                FirebaseAuth.instance.currentUser!.updatePhotoURL(user!.image);
                //FirebaseAuth.instance.currentUser.updatePhoneNumber(phonAuth);
                result = true;
              } catch (e) {
                print('email not regester errur ==== $e');
                message = 'Error this email ${user!.email} not correct' ;
                result = false;
              }


            }
      });
    }on FirebaseAuthException catch (e) {
      result = false;
      //print(e.message) ;
      message = e.message??'Error';
    }
    return {'state': result, 'message': message , 'target' : target};
  }



  updateUseWithNewPhone(UserLocalModel newUser , PhoneAuthCredential phonAuth ){
    try {
      FirebaseAuth.instance.currentUser!.updateEmail(newUser.email.trim());
      FirebaseAuth.instance.currentUser!.updatePassword(newUser.password);
      FirebaseAuth.instance.currentUser!.updateDisplayName(newUser.name);
      FirebaseAuth.instance.currentUser!.updatePhotoURL(newUser.image);
      FirebaseAuth.instance.currentUser!.updatePhoneNumber(phonAuth);
      return {'state': true, 'message': 'no' , 'target' : 'non'};

    }catch(e){
      return {'state': true, 'message': 'Error' , 'target' : 'non'};
    }
  }

  /*
  updatePhoneNombre(String verificationId ,  String smsCode ){

    PhoneAuthCredential phonAuth =  PhoneAuthProvider.credential(
        verificationId: 'verificationId', smsCode: 'smsCode' );
    FirebaseAuth.instance.currentUser.updatePhoneNumber(phonAuth);

  }
  
   */

  restPasswordForget(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return e.message;
    } catch (e) {
      return e;
    }
  }
}
