

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phoneshop/model/getModelFirebase/getUser/modelUserGet.dart';
import 'package:phoneshop/model/messages/model_messages.dart';

class GetMessages {

  GetUserFireBase getUser = GetUserFireBase() ;





  Stream<List<Message>> getMesag() async*  {
    String uid = await getUser.getDocUserFromFirebase() ;
    //print('mesgae.uidUser ===${mesgae.uidUser}') ;
    List<Message> _msg  = [] ;

    FirebaseFirestore.instance.collection('users').doc(uid).collection('Chats').snapshots().listen((event) {
      //_msg = [] ;
      event.docs.forEach((element) {
        print('element.data() == ${element.data()}') ;
        _msg.add(Message.fromJson(element.data())) ;
      });

    }) ;
    print('_msg.length ===${_msg.length}') ;
    yield _msg ;


    /*
    ListMessages _messageses = ListMessages.fromJson({
      'messages' : _msg
    });

     */
    //print('_msg.length ===${_msg.length}') ;
  }




}