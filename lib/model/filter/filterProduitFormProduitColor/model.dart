import 'package:phoneshop/model/produit/produit.dart';
import 'package:phoneshop/model/produit/produit_colors.dart';

class FilterProduitFromProduitColors {



  static Produit getPriorityProduitFromProduitColors(List<Produit> listProduit ){
    List<Produit> newList = [] ;
    Produit produitPriority ;
    //priority 1
    for(var produit in  listProduit){
      if(produit.contitu != 0 )
        newList.add(produit);
    }
    //priority 3
    if(newList.isEmpty){
      produitPriority = listProduit[0] ;
    }else{
      // priority 2
      newList.sort((a, b) => (a.contitu)!.compareTo(b.contitu!));
      produitPriority = newList[0] ;
    }

   return produitPriority ;


  }


  static getProduitsFromProduitColor(ProduitsColors produitsColors , String idProduit){

    for(var produit in produitsColors.listProduits!  ){
      if(produit.id.toString() == idProduit.toString() ){
        return produit ;
      }
    }


  }




}