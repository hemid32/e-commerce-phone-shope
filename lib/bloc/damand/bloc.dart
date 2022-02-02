

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/damand/event.dart';

class BlocSandDamand extends Bloc<EventDomands , dynamic >{
  BlocSandDamand() : super(null){
    on<EventSandDomand>(_sandDomand) ;
  }

   void _sandDomand(EventSandDomand event , Emitter <dynamic> emit )async {
     var _result = await event.sand();
     emit(_result) ;
   }

}