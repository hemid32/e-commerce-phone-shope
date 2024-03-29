
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/model/getModelFirebase/getMayOrder/my_order.dart';
import 'package:phoneshop/screens/myOrder/widgets/order_send_domand.dart';
import 'package:phoneshop/screens/myOrder/widgets/recoved_order.dart';
import 'package:phoneshop/screens/myOrder/widgets/shopping_order.dart';

import 'event.dart';

class BlocMyOrder extends Bloc<EventMyOrder , Widget>{
  BlocMyOrder() : super(OrderSendSomand()){
    on((event,Emitter<Widget> emit) {
      switch (event.runtimeType) {
        case EventScreenMyOrderSandDomand:
        //print('go to fav from event  ');
          emit( OrderSendSomand());
          break;
        case EventScreenMyOrderSoppingDomand:
          emit( ShoppingOrder());
          break;
        case EventScreenMyOrderRecovredDomand:
          emit( ReceivedOrder());
          break;

      }
    });

  }




  @override
  Stream<Widget> mapEventToState(event)  async* {
    // TODO: implement mapEventToState
    if(event.runtimeType == EventScreenMyOrderSandDomand){
      yield OrderSendSomand() ;
    }else if(event.runtimeType == EventScreenMyOrderSoppingDomand){
      yield ShoppingOrder() ;
    }else if(event.runtimeType == EventScreenMyOrderRecovredDomand){
      yield ReceivedOrder() ;
    }

  }
}