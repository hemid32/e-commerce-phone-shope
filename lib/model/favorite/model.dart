


import 'package:phoneshop/model/produit/produit_colors.dart';

class ModelFaveriote {
  //final String idProduit ;
  final String idProduit ;
  final ProduitsColors produitColors ;
  ModelFaveriote({required this.produitColors ,required this.idProduit});

  Map<String, dynamic> toMap(){
    return {
      'idProduit' : idProduit ,
      'produitColors' : produitColors.toMap() ,
    };
  }
}