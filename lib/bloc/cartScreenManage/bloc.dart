


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/model/cart/cart.dart';

import 'event.dart';

class BlocListDataCart extends Bloc<EventBlocDataCart ,  List<ModelCart>>{
  BlocListDataCart() : super([]);
  @override
  Stream<List<ModelCart>> mapEventToState(EventBlocDataCart event)async*  {
    // TODO: implement mapEventToState

    if(event is  EventShowList){
      //EventShowList model = event ;
      List<ModelCart> result1 = await event.showList() ;
      yield result1 ;
    }
    if(event is  EventDeletItemFromCart){
      //EventDeletItemFromCart model = event ;
      List<ModelCart> result = await event.deleted() ;
      yield result ;
    }
  }
}




