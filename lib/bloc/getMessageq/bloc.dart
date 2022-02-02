import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/getMessageq/events.dart';
import 'package:phoneshop/model/getModelFirebase/getUser/modelUserGet.dart';
import 'package:phoneshop/model/messages/model_messages.dart';

class BlocMassegersGet  extends Bloc<EventGetMessages , List<Message>>{
  BlocMassegersGet() : super([]){
    on<EventGetMessagesFromFire>(_getMessages) ;
  }
  void  _getMessages(EventGetMessagesFromFire event , Emitter emit ){
    emit(event.getMessages()) ;
  }
}

class BlocMessagesActiveDate extends Bloc<EventGetMessages , dynamic >{
  BlocMessagesActiveDate() : super([false , 1000000]){
    on<EventGetMessagesActiveDate>(_getMessagesActiveData) ;
  }

  _getMessagesActiveData(EventGetMessagesActiveDate  event , Emitter emit){
    emit(event.isActive()) ;
  }

}