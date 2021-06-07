



import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/favorite/listFavoite/event.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';

class BlocFavoriteList extends Bloc<EvsentListFavorite ,ListProduitsColors>{
  BlocFavoriteList() : super(ListProduitsColors());

  @override
  Stream<ListProduitsColors> mapEventToState(EvsentListFavorite event) async* {
    // TODO: implement mapEventToState
    if(event.runtimeType == EventListItemsFavoriteShowList){
      EventListItemsFavoriteShowList _eventRes = event ;
      ListProduitsColors _result = await _eventRes.listProduitFavorite() ;
      yield _result ;
    }else if(event.runtimeType == EventListItemsFavoriteDeleteItems){
      EventListItemsFavoriteDeleteItems _eventResult = event ;
      ListProduitsColors _resultAfterDeleted = await _eventResult.listProduitFavoriteAfterDeleted() ;
      yield _resultAfterDeleted ;
    }

  }
}