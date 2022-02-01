import 'package:phoneshop/model/produit/produit.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';

class EventScreenDetails {}

class EvensGoToProduit extends EventScreenDetails{
  final ProduitsColors  produisColors ;
  final int indexProduit ; // this is id produit

  //Produit produit ;
  EvensGoToProduit({required this.produisColors ,required  this.indexProduit});
  Produit produitResult(){
    //Produit produit = produisColors.listProduits[indexProduit] ;
    Produit produit = findProduit() ;
    print(produit.id ) ;
    return produit ;
  }

  findProduit(){
    late Produit targetProduit ;
    for(var produit in produisColors.listProduits!){
      if(produit.id == indexProduit )
        targetProduit = produit ;
    }
    return targetProduit ;
  }


}

class EventMinus extends EventScreenDetails {
  final int   totalProduit ;

   int  courentContitu ;

  EventMinus({required this.totalProduit,required this.courentContitu});

  int minus(){
    if(courentContitu == 1){
      return courentContitu ;
    }else {
      courentContitu = courentContitu -1  ;
      return courentContitu ;
    }
  }


}

class EventAdd extends EventScreenDetails {
  final int   totalProduit ;

  int  courentContitu ;

  EventAdd({required this.courentContitu ,required this.totalProduit});

  int add(){
    //print('totalProduit == $totalProduit');
    //print('courentContitu == $courentContitu');
    if(courentContitu == totalProduit){
      return courentContitu ;
    }else {
      courentContitu = courentContitu + 1 ;
      return courentContitu ;
    }
  }
}