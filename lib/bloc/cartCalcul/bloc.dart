

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/cartCalcul/events.dart';
import 'package:phoneshop/model/cart/cartCalcul.dart';

class CalculCartBloc extends Bloc<EventsCalculCart, ModelCartCalcul> {
  /// {@macro counter_bloc}
  CalculCartBloc() : super(ModelCartCalcul()){
    on<EventCart>(_calcul) ;
  }


  void _calcul(EventCart event , Emitter<ModelCartCalcul> emit ){
    emit(event.calcule()) ;
  }


}
