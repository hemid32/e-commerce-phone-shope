

import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class BlocDropDowenWilayat extends Bloc<EveneDropDowen , String >{
  BlocDropDowenWilayat() : super('El Oued'){
    on((event, emit) {
      if(event is EveneDropDowenValue ) {
        emit( event.value);
      }

    }) ;
  }

}