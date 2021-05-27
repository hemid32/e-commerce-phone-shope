


import 'package:phoneshop/model/produit/produit.dart';

class ModelCart {
  final Produit produit ;
  ModelCart({this.produit});
  factory ModelCart.FormJson(Map<String  , Produit > json ){
    return ModelCart(
      produit: json['produit'] ,
    );
  }

}

class ListModelCarte {
  final List<ModelCart> itemCart ;
  ListModelCarte({this.itemCart});
  factory ListModelCarte.FormJson(
      Map<String , List<ModelCart> > jsonDate
      ){
    return ListModelCarte(
      itemCart: jsonDate['itemCart'] ,
    );
  }





}