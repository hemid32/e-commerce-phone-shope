

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phoneshop/model/getModelFirebase/getUser/modelUserGet.dart';

import 'model_messages.dart';

class ServesicesImage {

  final Message mesgae ;

  ServesicesImage({this.mesgae});



  saveToFireBase() async {
    GetUserFireBase getUser = GetUserFireBase() ;
    //String uid = await getUser.getDocUserFromFirebase() ;
    //print('mesgae.uidUser ===${mesgae.uidUser}') ;

    try {
      var _message = FirebaseFirestore.instance.collection('users').doc(
          await getUser.getDocUserFromFirebase()).collection('Chats');

      await _message.add(mesgae.toMap());
      return true ;
    }catch(e){
      return false ;
    }
  }







}