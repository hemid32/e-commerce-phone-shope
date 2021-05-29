

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/cartCalcul/events.dart';
import 'package:phoneshop/model/cart/cartCalcul.dart';

class CalculCartBloc extends Bloc<EventsCalculCart, ModelCartCalcul> {
  /// {@macro counter_bloc}
  CalculCartBloc() : super(ModelCartCalcul());

  @override
  Stream<ModelCartCalcul> mapEventToState(EventsCalculCart event) async* {
    //print(event.runtimeType) ;
    if(event.runtimeType == EventCart ){
      //save Data adress
      EventCart result = event  ;
      // return data event adress
      yield result.calcule()   ;
    }

  }
}