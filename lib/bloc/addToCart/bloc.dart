import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

import 'event.dart';

class BlocAddToCartNewProduit extends Bloc<EventsAddToCartNew ,dynamic  >{
  BlocAddToCartNewProduit() : super(false);
  @override
  Stream<dynamic > mapEventToState(EventsAddToCartNew event) async*  {
    // TODO: implement mapEventToState
    if(event is EventAddNewProduitToCart){
      yield event.addToHive() ;
    }


  }
}
