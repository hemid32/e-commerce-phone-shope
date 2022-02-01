

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/dataDetailsOrder/event.dart';

class  BlocDataOrderShow extends Bloc<EventDataOrderShow , dynamic>{
  BlocDataOrderShow() : super(0);

  @override
  Stream mapEventToState(EventDataOrderShow event) async* {
    // TODO: implement mapEventToState
    if (event is EventDataOdererShoawData) {
      //EventDataOdererShoawData _result = event;
      yield [
        event.calulerBuy,
        event.methoShopping,
        event.address,
        event.listMedelCart,
        event.state,
        event.uidDomand
      ];
    }
  }
}