/*

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phoneshop/bloc/allProduitFilter/event.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';

//import 'event.dart';

class BlocAllProduitFilter extends Bloc<EvenetsAllProduitFilters ,  ListProduitsColors> {
   BlocAllProduitFilter() : super(ListProduitsColors()){
   on<EventAllProduitTypeFhone>(_getAllProducts) ;
   on<EventAllRecentOffers>(_getTheRecentOffers) ;
   on<EventAllProduitAfterFillter>(_getAllAfterFilter) ;
   on<EventAllProduitTheBest>(_getTheBestProduct) ;
  }

  void _getAllProducts(EventAllProduitTypeFhone event , Emitter<ListProduitsColors> emit ){
    ListProduitsColors result = event.filtType() ;
    emit(result) ;
  }
  void _getTheBestProduct(EventAllProduitTheBest event , Emitter<ListProduitsColors> emit )async{
    ListProduitsColors result = await  event.fiterTheBest() ;
    emit(result) ;
  }
  void _getTheRecentOffers(EventAllRecentOffers event , Emitter<ListProduitsColors> emit )async{
    ListProduitsColors result = await  event.fiterRecentOffers() ;
    emit(result) ;
  }
  void _getAllAfterFilter(EventAllProduitAfterFillter event , Emitter<ListProduitsColors> emit )async{
    ListProduitsColors result =   event.dataFilter ;
    emit(result) ;
  }

}

 */
