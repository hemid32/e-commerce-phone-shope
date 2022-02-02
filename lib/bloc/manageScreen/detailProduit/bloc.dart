
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/model/produit/produit.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';
import 'event.dart';

class BlocScreenDetailProduit extends  Bloc<EventScreenDetails ,List<dynamic>  >{


  BlocScreenDetailProduit() : super([Produit() ,ProduitsColors() ]){
    on<EvensGoToProduit>(_goToPoduct) ;
  }

  void _goToPoduct(EvensGoToProduit event , Emitter<List<dynamic> > emit ){
    emit(
        [event.produitResult() , event.produisColors ,
          event.indexProduit,event.produisColors.id]
    );
  }
}


class BlocMinusAddProduitFromDetail extends Bloc <EventScreenDetails , int >{
  BlocMinusAddProduitFromDetail() : super(1){
    on<EventMinus>(_minus);
    on<EventAdd>(_add);
  }

  void _minus(EventMinus event , Emitter<int> emit ){
    emit(event.minus()) ;
  }
  void _add(EventAdd event , Emitter<int> emit ){
    emit(event.add()) ;
  }
}


