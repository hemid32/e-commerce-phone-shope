

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';

import 'event.dart';

class BlocAllProduitFilter extends Bloc<EvenetsAllProduitFilters ,  ListProduitsColors> {
  BlocAllProduitFilter() : super(ListProduitsColors());

  @override
  Stream<ListProduitsColors> mapEventToState(event) async* {
    // TODO: implement mapEventToState
    if(event.runtimeType == EventAllProduitTypeFhone){
      EventAllProduitTypeFhone result = event ;
      yield  result.filtType() ;
    }
    if(event.runtimeType == EventAllProduitTheBest ){
      EventAllProduitTheBest result = event  ;
      yield result.fiterTheBest() ;
    }
  }
}