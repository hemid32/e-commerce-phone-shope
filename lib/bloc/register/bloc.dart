

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/register/event.dart';

class BlocRegisterUser extends Bloc<EventRegister , dynamic >{
  BlocRegisterUser() : super(null){
    on<EventsRegisters>(_regester) ;
  }
  void _regester(EventsRegisters event  , Emitter emit)async {
    var _result = await event.rgisterUser();
    emit(_result) ;
  }

}