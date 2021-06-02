


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/model/cart/cart.dart';

import 'event.dart';

class BlocListDataCart extends Bloc<EventBlocDataCart ,  List<ModelCart>>{
  BlocListDataCart() : super(null);
  @override
  Stream<List<ModelCart>> mapEventToState(EventBlocDataCart event)async*  {
    // TODO: implement mapEventToState

    if(event.runtimeType == EventShowList){
      EventShowList model = event ;
      List<ModelCart> result1 = await model.showList() ;
      yield result1 ;
    }
    if(event.runtimeType == EventDeletItemFromCart){
      EventDeletItemFromCart model = event ;
      List<ModelCart> result = await model.deleted() ;
      yield result ;
    }
  }
}




