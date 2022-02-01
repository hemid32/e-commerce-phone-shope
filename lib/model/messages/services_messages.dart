

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phoneshop/model/getModelFirebase/getUser/modelUserGet.dart';

import 'model_messages.dart';

class ServesicesImage {

  final Message mesgae ;

  ServesicesImage({required this.mesgae});



  saveToFireBase() async {

    print(mesgae.toMap()) ;
    GetUserFireBase getUser = GetUserFireBase() ;
    String uid = await getUser.getDocUserFromFirebase() ;
    //print('mesgae.uidUser ===${mesgae.uidUser}') ;
    print('uid =============== $uid') ;

    try {
      var _message = FirebaseFirestore.instance.collection('users').doc(
          await getUser.getDocUserFromFirebase()).collection('Chats');


      await _message.add(mesgae.toMap());
      return true ;
    }catch(e){
      print(e) ;
      return false ;
    }
  }







}