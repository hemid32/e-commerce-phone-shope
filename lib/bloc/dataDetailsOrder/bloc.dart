

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/dataDetailsOrder/event.dart';

class  BlocDataOrderShow extends Bloc<EventDataOrderShow , dynamic>{
  BlocDataOrderShow() : super(0);

  @override
  Stream mapEventToState(EventDataOrderShow event) async*  {
    // TODO: implement mapEventToState
    EventDataOdererShoawData _result = event ;
    yield [_result.calulerBuy , _result.methoShopping , _result.address , _result.listMedelCart , _result.state , _result.uidDomand];
  }
}