

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'events.dart';

class BlocLoading extends Bloc<EventLoading ,  bool>{
  BlocLoading() : super(false){
    on<EventLoadingStart>(_start) ;
    on<EventLoadingStop>(_end) ;
  }

  void  _start(EventLoadingStart event , Emitter<bool> emit ){
    emit(true) ;
  }
  void  _end(EventLoadingStop event , Emitter<bool> emit ){
    emit(false) ;
  }





}