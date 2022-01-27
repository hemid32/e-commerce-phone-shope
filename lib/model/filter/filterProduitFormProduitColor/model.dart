import 'package:phoneshop/model/produit/produit.dart';

class FilterProduitFromProduitColors {



  // priority 1 == contitue > 1
  // priority 2 == the most  contitue
  // priority 3 == if list => empty return [0] produit from index  0
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
      newList.sort((a, b) => (a.contitu).compareTo(b.contitu));
      produitPriority = newList[0] ;
    }

   return produitPriority ;


  }




}