

import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class AddressBlocRadio extends Bloc<EventsAddress, dynamic> {
  /// {@macro counter_bloc}
  AddressBlocRadio() : super('null'){
    on<EvenstRadioAddres>(_adress) ;
  }

  _adress(EvenstRadioAddres event  , Emitter emit){
    emit(event.valurRadio) ;
  }

}
