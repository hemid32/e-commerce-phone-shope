


import 'package:phoneshop/model/produit/produit.dart';

class ModelCart {
  final Produit produit ;
  final int  contituPay ;
  ModelCart({this.produit, this.contituPay = 1  });
  factory ModelCart.FormJson(Map<String  , dynamic > json ){
    return ModelCart(
      produit: json['produit'] ,
      contituPay: json['contituPay']
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