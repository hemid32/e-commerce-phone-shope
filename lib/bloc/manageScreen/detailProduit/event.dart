import 'package:phoneshop/model/produit/produit.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';

class EventScreenDetails {}

class EvensGoToProduit extends EventScreenDetails{
  final ProduitsColors  produisColors ;
  final int indexProduit ;

  //Produit produit ;
  EvensGoToProduit({this.produisColors , this.indexProduit});
  Produit produitResult(){
    Produit produit = produisColors.listProduits[indexProduit] ;
    return produit ;
  }


}

class EventMinus extends EventScreenDetails {
  final int   totalProduit ;

   int  courentContitu ;

  EventMinus({this.totalProduit, this.courentContitu});

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

  EventAdd({this.courentContitu , this.totalProduit});

  int add(){
    print('totalProduit == $totalProduit');
    print('courentContitu == $courentContitu');
    if(courentContitu == totalProduit){
      return courentContitu ;
    }else {
      courentContitu = courentContitu + 1 ;
      return courentContitu ;
    }
  }
}