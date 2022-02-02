
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/search/event.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';

class BlocEventSearch extends Bloc<EventSearch , ListProduitsColors> {
  BlocEventSearch() : super(ListProduitsColors()){
    on((event, emit) {
      if(event is EventListSearch) {
        emit( event.search() ) ;
      }
    });
  }

}