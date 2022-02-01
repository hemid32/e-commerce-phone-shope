

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phoneshop/model/user/user.dart';

class GetUserFireBase{


  Future<UserLocalModel> getUser()async  {
    /*
    final  Map<String , dynamic> _usr = await getDataFromFirebase() ;
    final  UserLocalModel _userDt  = UserLocalModel.fromJson(
      _usr
    );
    return _userDt ;

     */
    var _user = FirebaseAuth.instance.currentUser ;
    final  UserLocalModel _userDt  = UserLocalModel(
      email: _user!.email!,
      image: _user.photoURL! ,
      nombrePhon: _user.phoneNumber! ,
      name: _user.displayName!,
      password: '***' ,
      uid: _user.uid ,

    )  ;

    return _userDt ;
  }
  getDataFromFirebase() async  {
    if(FirebaseAuth.instance.currentUser != null ){
    String uid = FirebaseAuth.instance.currentUser!.uid ;
    final    document =   FirebaseFirestore.instance.collection('users').where('uid' , isEqualTo: uid);
    var _data =  await document.get() ;
    var _userData = Map<String, dynamic>.from(_data.docs[0].data()) ;
    return  _userData   ;
    }
  }

  Future<String>  getDocUserFromFirebase()async {
    String uid = FirebaseAuth.instance.currentUser!.uid ;
    print(uid) ;
    final    document =   FirebaseFirestore.instance.collection('users').where('uid' , isEqualTo: uid);
    var _data =  await document.get() ;
    return    _data.docs[0].id  ;
  }


}



final userDataFireBase  = GetUserFireBase() ;