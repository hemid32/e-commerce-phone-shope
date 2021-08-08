


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/user/events.dart';
import 'package:phoneshop/model/user/user.dart';

class BlocUserGetModel extends Bloc<EventUser , List>{
  BlocUserGetModel({UserLocalModel initialState}) : super([initialState]);

  @override
  Stream<List> mapEventToState(EventUser event)  async* {
    // TODO: implement mapEventToState
    //throw UnimplementedError();
    if(event.runtimeType == EventUserGet){
      EventUserGet _user  = event ;
      UserLocalModel data = await _user.getUserFromFireBase() ;
      yield [data] ;
    }
  }
}