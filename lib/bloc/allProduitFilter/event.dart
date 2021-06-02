

import 'dart:math';

import 'package:phoneshop/model/produit/produit_colors.dart';
import 'package:phoneshop/model/produit/servises.dart';

class EvenetsAllProduitFilters {}



class EventAllProduitTypeFhone extends EvenetsAllProduitFilters {
  final String phoneType   ;
  EventAllProduitTypeFhone({this.phoneType});

  ListProduitsColors filtType(){
    List<ProduitsColors> listProduitFilter  = [] ;
    ListProduitsColors  listProduit = getProduitColors() ;

    listProduit.produits.forEach((element) {
      if(element.typePhone == phoneType){
        listProduitFilter.add(element) ;
      }

    });
    ListProduitsColors result = ListProduitsColors.fronJson({
      'produits' : listProduitFilter
    });
    //print('result filter ==== ${result.produits.length} ') ;
    return result ;
  }
}

class EventAllProduitTheBest extends EvenetsAllProduitFilters{
  List<ProduitsColors> listProduitFilterThebBest  = [] ;
  ListProduitsColors fiterTheBest(){
    ListProduitsColors  listProduit = getProduitColors() ;
    List<int> listNombrePaysProduits = [] ;
    listProduit.produits.forEach((element) {
      listNombrePaysProduits.add(element.nombrePay) ;
    });

    List<int>  listIndexBestProduit = getHigthValue(listNombrePaysProduits);

    List<ProduitsColors> result = []  ;

    listIndexBestProduit.forEach((element) {
      result.add(listProduit.produits[element]);
    });
    ListProduitsColors resultfilter = ListProduitsColors.fronJson({
      'produits' : result
    });
    print('resultfilter the best === ${result.length}') ;
    return resultfilter ;

  }
  getHigthValue(List<int> v){
    List<int> r  = []  ;
    var  i = 0  ;
      while (i < v.length  ){
        int  max = v.reduce((value, element) => value > element ?  value : element )  ;
        r.add(v.indexOf(max)) ;
        v.remove(max) ;
        i++ ;
      }

      return r ;
  }



}


