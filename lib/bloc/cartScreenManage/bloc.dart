


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/model/cart/cart.dart';

import 'event.dart';

class BlocListDataCart extends Bloc<EventBlocDataCart ,  List<ModelCart>>{
  BlocListDataCart() : super([]){
    on<EventShowList>(_showCard) ;
    on<EventDeletItemFromCart>(_deleCardItem) ;
  }

  void _showCard(EventShowList event  , Emitter <List<ModelCart>> emit )async {
    List<ModelCart> result1 = await event.showList() ;
    emit(result1) ;
  }
  void _deleCardItem(EventDeletItemFromCart event  , Emitter <List<ModelCart>> emit )async {
    List<ModelCart> delet = await event.deleted() ;
    emit(delet) ;
  }


}




