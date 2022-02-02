import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';

class BlocAddToCartNewProduit extends Bloc<EventsAddToCartNew ,dynamic  >{
  BlocAddToCartNewProduit() : super(false){
    on<EventAddNewProduitToCart>(_addProduitToCard) ;
  }

  void _addProduitToCard(EventAddNewProduitToCart event , Emitter<dynamic> emit ){
    emit(event.addToHive()) ;
  }

}
