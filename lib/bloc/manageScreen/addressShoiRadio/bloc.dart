

import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class AddressBlocRadio extends Bloc<EventsAddress, dynamic> {
  /// {@macro counter_bloc}
  AddressBlocRadio() : super(null);
  @override
  Stream<String> mapEventToState(EventsAddress event) async* {
    //print(event.runtimeType) ;
    if(event.runtimeType == EvenstRadioAddres ){
      EvenstRadioAddres radio = event ;
      yield radio.valurRadio  ;
    }
  }
}
