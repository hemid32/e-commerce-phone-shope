

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:phoneshop/model/user/user.dart';

class GetUserFireBase{


  Future<UserLocalModel> getUser()async  {
    final  Map<String , dynamic> _usr = await getDataFromFirebase() ;
    final  UserLocalModel _userDt  = UserLocalModel.fromJson(
      _usr
    );
    return _userDt ;
  }
  getDataFromFirebase() async  {
    if(FirebaseAuth.instance.currentUser != null ){
    String uid = FirebaseAuth.instance.currentUser.uid ;
    final    document =   FirebaseFirestore.instance.collection('users').where('uid' , isEqualTo: uid);
    var _data =  await document.get() ;
    var _userData = Map<String, dynamic>.from(_data.docs[0].data()) ;
    return  _userData   ;
    }
  }


}



final userDataFireBase  = GetUserFireBase() ;