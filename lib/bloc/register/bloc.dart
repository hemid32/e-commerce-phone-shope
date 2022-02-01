

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/register/event.dart';

class BlocRegisterUser extends Bloc<EventRegister , dynamic >{
  BlocRegisterUser() : super(null);

  @override
  Stream mapEventToState(EventRegister event)async*  {
    // TODO: implement mapEventToState
    if(event is EventsRegisters ) {
      EventsRegisters _userEvent = event;
      var _result = await _userEvent.rgisterUser();
      yield _result;
    }

  }
}