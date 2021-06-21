

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/damand/event.dart';

class BlocSandDamand extends Bloc<EventDomands , dynamic >{
  BlocSandDamand() : super(null);

  @override
  Stream mapEventToState(EventDomands event) async* {
    // TODO: implement mapEventToState
    EventSandDomand _sand = event ;
    var  _result = await _sand.sand() ;
    yield _result ;
  }
}