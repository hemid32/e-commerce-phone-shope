

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/damand/event.dart';

class BlocSandDamand extends Bloc<EventDomands , dynamic >{
  BlocSandDamand() : super(null);

  @override
  Stream mapEventToState(EventDomands event) async* {
    // TODO: implement mapEventToState
    if(event is EventSandDomand ) {
      var _result = await event.sand();
      yield _result;
    }
  }
}