

import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class ShoppingBlocRadio extends Bloc<EventsShopping, dynamic> {
  /// {@macro counter_bloc}
  ShoppingBlocRadio() : super(null);
  @override
  Stream<String> mapEventToState(EventsShopping event) async* {
    //print(event.runtimeType) ;
    if(event is   EvenstRadio ){
      EvenstRadio radio = event ;
      yield radio.valurRadio  ;
    }
  }
}
