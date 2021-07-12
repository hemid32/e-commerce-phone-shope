import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/getMessageq/events.dart';
import 'package:phoneshop/model/getModelFirebase/getUser/modelUserGet.dart';
import 'package:phoneshop/model/messages/model_messages.dart';

class BlocMassegersGet  extends Bloc<EventGetMessages , List<Message>>{
  BlocMassegersGet() : super([]);

  GetUserFireBase getUser = GetUserFireBase() ;


  @override
  Stream<List<Message>> mapEventToState(EventGetMessages event) async* {
    // TODO: implement mapEventToState
    /*
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
    
     */
   // print('_msg.length ===${_msg.length}') ;
    if(event.runtimeType == EventGetMessagesFromFire ){
      EventGetMessagesFromFire _messages = event ;
      yield _messages.getMessages() ;
    }
    //yield  ;
  }


  



}