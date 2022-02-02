

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/dataDetailsOrder/event.dart';

class  BlocDataOrderShow extends Bloc<EventDataOrderShow , dynamic>{
  BlocDataOrderShow() : super(0){
    on<EventDataOdererShoawData>(_showDeteild) ;
  }

  void  _showDeteild(EventDataOdererShoawData event , Emitter emit ){
    emit(
        [
          event.calulerBuy,
          event.methoShopping,
          event.address,
          event.listMedelCart,
          event.state,
          event.uidDomand
        ]
    );
  }


}