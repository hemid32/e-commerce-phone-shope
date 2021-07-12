import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/getMessageq/events.dart';
import 'package:phoneshop/model/getModelFirebase/getUser/modelUserGet.dart';
import 'package:phoneshop/model/messages/model_messages.dart';

class BlocMassegersGet  extends Bloc<EventGetMessages , List<Message>>{
  BlocMassegersGet() : super([]);

  @override
  Stream<List<Message>> mapEventToState(EventGetMessages event) async* {
    // TODO: implement mapEventToState

    if(event.runtimeType == EventGetMessagesFromFire ){
      EventGetMessagesFromFire _messages = event ;
      yield _messages.getMessages() ;
    }
  }
}

class BlocMessagesActiveDate extends Bloc<EventGetMessages , dynamic >{
  BlocMessagesActiveDate() : super([false , 1000000]);

  @override
  Stream<dynamic> mapEventToState(EventGetMessages event) async* {
    // TODO: implement mapEventToState
    if(event.runtimeType == EventGetMessagesActiveDate ){
      EventGetMessagesActiveDate _result =event ;
      yield _result.isActive() ;
    }
  }
}