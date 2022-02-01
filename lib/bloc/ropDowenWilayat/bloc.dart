

import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class BlocDropDowenWilayat extends Bloc<EveneDropDowen , String >{
  BlocDropDowenWilayat() : super('El Oued');

  @override
  Stream<String> mapEventToState(EveneDropDowen event) async* {
    // TODO: implement mapEventToState
    if(event is EveneDropDowenValue ) {
      EveneDropDowenValue _result = event;
      yield _result.value;
    }
  }
}