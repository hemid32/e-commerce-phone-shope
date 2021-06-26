

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/filterAllProduit/event.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';

class BlocFiltersAllProduits extends Bloc<EventFilterAllProduit , ListProduitsColors>{
  BlocFiltersAllProduits() : super(ListProduitsColors());

  @override
  Stream<ListProduitsColors> mapEventToState(event) async* {
    // TODO: implement mapEventToState
    if(event.runtimeType == EventsFilterAllProduitsevnts){
      EventsFilterAllProduitsevnts _result = event ;
      yield _result.filter() ;
    }
  }
}