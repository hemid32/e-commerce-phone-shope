

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';

class BlocLoading extends Bloc<EventLoading ,  bool>{
  BlocLoading() : super(null);

  @override
  Stream<bool> mapEventToState(EventLoading event) async* {
    // TODO: implement mapEventToState
    if(event.runtimeType == EventLoadingStart){
      yield true ;
    }else if( event.runtimeType == EventLoadingStop){
      yield false ;
    }
  }



}