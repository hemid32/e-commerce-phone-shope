

import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class ShoppingBlocRadio extends Bloc<EventsShopping, dynamic> {
  /// {@macro counter_bloc}
  ShoppingBlocRadio() : super(null){
    on((event, emit) {
      if(event is EvenstRadio ){
        emit(event.valurRadio) ;
      }
    });
  }

}
