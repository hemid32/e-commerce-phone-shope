
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/model/produit/produit.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';
import 'event.dart';

class BlocScreenDetailProduit extends  Bloc<EventScreenDetails ,List<dynamic>  >{


  BlocScreenDetailProduit() : super([Produit() ,ProduitsColors() ]);

  @override
  Stream<List<dynamic>> mapEventToState(EventScreenDetails event) async* {
    // TODO: implement mapEventToState
    if(event.runtimeType == EvensGoToProduit ){
      EvensGoToProduit produit = event ;
      yield [produit.produitResult() , produit.produisColors , produit.indexProduit,produit.produisColors.id] ;
    }
  }
}


class BlocMinusAddProduitFromDetail extends Bloc <EventScreenDetails , int >{
  BlocMinusAddProduitFromDetail() : super(1);

  @override
  Stream<int> mapEventToState(EventScreenDetails event) async* {
    // TODO: implement mapEventToState
    if(event.runtimeType == EventMinus){
      EventMinus results = event ;
      yield results.minus() ;
    }else if(event.runtimeType == EventAdd){
      EventAdd results = event ;
      yield results.add() ;

    }
  }
}


