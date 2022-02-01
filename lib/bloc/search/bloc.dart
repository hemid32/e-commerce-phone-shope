
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/search/event.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';

class BlocEventSearch extends Bloc<EventSearch , ListProduitsColors> {
  BlocEventSearch() : super(ListProduitsColors());

  @override
  Stream<ListProduitsColors> mapEventToState(EventSearch event) async*{
    // TODO: implement mapEventToState
    if(event is EventListSearch) {
      EventListSearch _result = event;

      yield _result.search();
    }

  }
}