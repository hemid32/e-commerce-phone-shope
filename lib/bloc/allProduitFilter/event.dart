

//import 'dart:math';
/*
import 'package:phoneshop/model/getModelFirebase/theBestProduit/model.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';
import 'package:phoneshop/model/produit/servises.dart';

class EvenetsAllProduitFilters {}



class EventAllProduitTypeFhone extends EvenetsAllProduitFilters {
  final String? phoneType   ;
  EventAllProduitTypeFhone({this.phoneType});

  ListProduitsColors filtType(){
    List<ProduitsColors> listProduitFilter  = [] ;
    //ListProduitsColors  listProduit = getProduitColors() ;
    /*
    listProduit.produits?.forEach((element) {
      if(element.typePhone == phoneType){
        listProduitFilter.add(element) ;
      }

    });

     */
    ListProduitsColors result = ListProduitsColors.fronJson({
      'produits' : listProduitFilter
    });
    print('result filter ==== ${result.produits!.length} ') ;
    return result ;
  }
}

class EventAllProduitTheBest extends EvenetsAllProduitFilters{
  final  GetTheBestProduits  _getBest = GetTheBestProduits() ;
  List<ProduitsColors> listProduitFilterThebBest  = [] ;
  Future<ListProduitsColors> fiterTheBest() async {
   final _result = await  _getBest.getTheBestProduit() ;
   return _result ;
  }

}

class EventAllRecentOffers extends EvenetsAllProduitFilters{
  //final  GetTheBestProduits  _getRecentOffers = GetTheBestProduits() ;
  Future<ListProduitsColors> fiterRecentOffers() async {
    final _result = await  _getRecentOffers.getRecentOffers() ;
    return _result ;
  }

}



class EventAllProduitAfterFillter extends EvenetsAllProduitFilters{
  final  ListProduitsColors  dataFilter  ;

  EventAllProduitAfterFillter({ required this.dataFilter});


}

 */
