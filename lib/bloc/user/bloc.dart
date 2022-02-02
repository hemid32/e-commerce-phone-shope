
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/user/events.dart';
import 'package:phoneshop/model/user/user.dart';

class BlocUserGetModel extends Bloc<EventUser , List>{
  BlocUserGetModel({required UserLocalModel initialState}) : super([initialState]){
    on<EventUserGet>(_getUser) ;
  }

  void _getUser(EventUserGet event  , Emitter<List> emit) async  {
    UserLocalModel data = await event.getUserFromFireBase() ;
    emit([data]) ;
  }


}