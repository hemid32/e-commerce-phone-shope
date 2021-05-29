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